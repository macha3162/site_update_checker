class SiteCrawlJob < ApplicationJob
  queue_as :default

  def perform(site)
    if site.may_run?
      begin
        site.run!
        if (site.crawling)
          site.found_diff!
          User.send_notice.each do |user|
            UserMailer.diff_notice(user, site).deliver_now
          end
        else
          site.no_diff!
        end
      rescue => e
        logger.warn e
        site.error!
      end
    else
      # 実行から1日以上経過したものは、エラーとする
      if site.updated_at < Date.yesterday
        site.error!
      else
        logger.info '差分の確認が済んでいないのでクローリングをスキップします。'
      end
    end
  end
end
