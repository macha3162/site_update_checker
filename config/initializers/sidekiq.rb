Sidekiq.configure_server do |config|
  if Rails.env.production?
    config.redis = Redis.new(url: URI.parse(ENV['REDISTOGO_URL']))
  else
    config.redis = {url: 'redis://localhost:6379', namespace: 'sidekiq'}
  end
end