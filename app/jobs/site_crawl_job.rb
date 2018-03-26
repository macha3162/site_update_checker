class SiteCrawlJob < ApplicationJob
  queue_as :default

  def perform(site)
    if site.may_run?
      begin
        site.run!
        if (site.crawling)
          site.found_diff!
        else
          site.no_diff!
        end
      rescue => e
        logger.warn e
        site.error!
      end
    else
      logger.info '差分の確認が済んでいないのでクローリングをスキップします。'
    end
  end
end
