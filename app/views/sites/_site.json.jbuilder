json.extract! site, :id, :name, :url, :site_versions_count, :status, :last_crawled_at, :created_at, :updated_at
json.url site_url(site, format: :json)
