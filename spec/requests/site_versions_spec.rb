require 'rails_helper'

RSpec.describe "SiteVersions", type: :request do
  describe "GET /site_versions" do
    it "works! (now write some real specs)" do
      get site_versions_path
      expect(response).to have_http_status(200)
    end
  end
end
