class SiteVersion < ApplicationRecord
  belongs_to :site, counter_cache: true

  before_save :generate_check_sum

  # 圧縮したい.
  # def body=(str)
  #   write_attribute(:body, gzip = ActiveSupport::Gzip.compress(str).gsub("\u0000", ''))
  # end
  #
  # def body
  #   ActiveSupport::Gzip.decompress(read_attribute(:body))
  # end

  def previous
    site.site_versions.where('id < ?', self.id).order('id DESC').first
  end

  def next
    site.site_versions.where('id > ?', self.id).order('id ASC').first
  end

  def diff_body
    Sanitize.clean(body, remove_contents: %w[script style]).gsub(/[\r\n|\t|\r|\n]+/, "\n")
  end

  def generate_check_sum
    self.checksum = Digest::MD5.hexdigest(diff_body)
  end
end
