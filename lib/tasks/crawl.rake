namespace :crawl do
  desc "すべてのサイトにアクセスする."
  task :all => :environment do
    Site.find_each do |site|
      SiteCrawlJob.perform_later(site)
    end
  end

  desc "ステータスを確認済みにする."
  task :reset_status => :environment do
    Site.update_all(status: 'checked')
  end
end