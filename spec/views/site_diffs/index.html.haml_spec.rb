require 'rails_helper'

RSpec.describe "site_diffs/index", type: :view do
  before(:each) do
    assign(:site_diffs, [
      SiteVersion.create!(
        :site_id => 2,
        :checksum => "Checksum",
        :body => "MyText"
      ),
      SiteVersion.create!(
        :site_id => 2,
        :checksum => "Checksum",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of site_diffs" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Checksum".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
