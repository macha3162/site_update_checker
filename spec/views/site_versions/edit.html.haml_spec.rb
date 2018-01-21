require 'rails_helper'

RSpec.describe "site_versions/edit", type: :view do
  before(:each) do
    @site_version = assign(:site_version, SiteVersion.create!(
      :site_id => 1,
      :checksum => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit site_version form" do
    render

    assert_select "form[action=?][method=?]", site_version_path(@site_version), "post" do

      assert_select "input[name=?]", "site_version[site_id]"

      assert_select "input[name=?]", "site_version[checksum]"

      assert_select "textarea[name=?]", "site_version[body]"
    end
  end
end
