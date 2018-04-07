Sidekiq.configure_server do |config|
  if Rails.env.production?
    config.redis = {url: ENV['REDISTOGO_URL'], namespace: 'sidekiq'}
  else
    config.redis = {url: 'redis://localhost:6379', namespace: 'sidekiq'}
  end
end

Sidekiq.configure_client do |config|
  if Rails.env.production?
    config.redis = {url: ENV['REDISTOGO_URL'], namespace: 'sidekiq'}
  else
    config.redis = {url: 'redis://localhost:6379', namespace: 'sidekiq'}
  end
end