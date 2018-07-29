class Site < ApplicationRecord
  include AASM
  paginates_per 50

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :site_type
  has_many :site_versions, dependent: :destroy

  validates :name, :url, presence: true
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/

  aasm :status do
    state :non_diff, initial: true
    state :running, :exist_diff, :failed, :checked

    event :run do
      transitions from: [:non_diff, :checked], to: :running
    end

    event :found_diff do
      transitions from: :running, to: :exist_diff
    end

    event :no_diff do
      transitions from: :running, to: :non_diff
    end

    event :check do
      transitions from: %i[failed exist_diff], to: :checked
    end

    event :error do
      transitions to: :failed
    end
  end


  def version_number(current)
    current.present? ? site_versions.where('id <= ?', current.id).count : 0
  end

  def current_body
    site_versions.last
  end


  # データのクローリングを行なう
  # 前回クロール時より差分が合った場合には、データを保存する。
  # return true: 差分あり, false: 差分なし
  def crawling


    response = Faraday.get url
    body_html = response.body.toutf8
    touch(:last_crawled_at)
    current_version = site_versions.last
    new_version = site_versions.build({body: body_html, status_code: response.status})
    if new_version.generate_check_sum == current_version.try(:checksum)
      new_version.destroy
      logger.info '前回取得分からコンテンツに差分はありませんでした。'
      false
    else
      new_version.save
      logger.info '前回取得分からコンテンツに差分がありました。'
      true
    end
  end

  # def get_content(url)
  #   response = Faraday.get url
  #
  #   case response.headers['content-type']
  #   when /pdf/
  #     PDF::Reader.new
  #   end
  # end
  #
  # require 'open-uri'
  #
  # io = open('http://example.com/somefile.pdf')
  # reader = PDF::Reader.new(io)
  # puts reader.info
end
