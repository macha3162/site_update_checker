FactoryBot.define do
  factory :site do
    name "テストサイト"
    url "https://example.com"
    site_type SiteType.first
  end
end
