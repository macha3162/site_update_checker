require 'rails_helper'

RSpec.describe "site_versions/new", type: :view do
  before(:each) do
    assign(:site_version, SiteVersion.new(
      :site_id => 1,
      :checksum => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new site_version form" do
    render

    assert_select "form[action=?][method=?]", site_versions_path, "post" do

      assert_select "input[name=?]", "site_version[site_id]"

      assert_select "input[name=?]", "site_version[checksum]"

      assert_select "textarea[name=?]", "site_version[body]"
    end
  end
end
