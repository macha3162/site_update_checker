Sidekiq.configure_server do |config|
  if Rails.env.production? && ENV['REDISCLOUD_URL']
    config.redis = {url: ENV['REDISCLOUD_URL'], namespace: 'sidekiq'}
  else
    config.redis = {url: 'redis://localhost:6379', namespace: 'sidekiq'}
  end
end