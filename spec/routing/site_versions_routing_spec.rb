require "rails_helper"

RSpec.describe SiteVersionsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/site_versions").to route_to("site_versions#index")
    end

    it "routes to #new" do
      expect(:get => "/site_versions/new").to route_to("site_versions#new")
    end

    it "routes to #show" do
      expect(:get => "/site_versions/1").to route_to("site_versions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/site_versions/1/edit").to route_to("site_versions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/site_versions").to route_to("site_versions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/site_versions/1").to route_to("site_versions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/site_versions/1").to route_to("site_versions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/site_versions/1").to route_to("site_versions#destroy", :id => "1")
    end

  end
end
