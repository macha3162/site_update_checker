require 'rails_helper'

RSpec.describe "sites/index", type: :view do
  before(:each) do
    assign(:sites, [
      Site.create!(
        :name => "Name",
        :url => "Url",
        :site_versions_count => 2,
        :status => "Status"
      ),
      Site.create!(
        :name => "Name",
        :url => "Url",
        :site_versions_count => 2,
        :status => "Status"
      )
    ])
  end

  it "renders a list of sites" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
