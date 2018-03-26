require "rails_helper"

RSpec.describe SiteDiffsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/site_diffs").to route_to("site_diffs#index")
    end

    it "routes to #new" do
      expect(:get => "/site_diffs/new").to route_to("site_diffs#new")
    end

    it "routes to #show" do
      expect(:get => "/site_diffs/1").to route_to("site_diffs#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/site_diffs/1/edit").to route_to("site_diffs#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/site_diffs").to route_to("site_diffs#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/site_diffs/1").to route_to("site_diffs#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/site_diffs/1").to route_to("site_diffs#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/site_diffs/1").to route_to("site_diffs#destroy", :id => "1")
    end

  end
end
