Sidekiq.configure_server do |config|
  if Rails.env.production? && ENV['REDIS_URL']
    config.redis = {url: ENV['REDIS_URL'], namespace: 'sidekiq'}
  else
    config.redis = {url: 'redis://localhost:6379', namespace: 'sidekiq'}
  end
end