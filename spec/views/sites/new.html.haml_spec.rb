require 'rails_helper'

RSpec.describe "sites/new", type: :view do
  before(:each) do
    assign(:site, Site.new(
      :name => "MyString",
      :url => "MyString",
      :site_versions_count => 1,
      :status => "MyString"
    ))
  end

  it "renders new site form" do
    render

    assert_select "form[action=?][method=?]", sites_path, "post" do

      assert_select "input[name=?]", "site[name]"

      assert_select "input[name=?]", "site[url]"

      assert_select "input[name=?]", "site[site_versions_count]"

      assert_select "input[name=?]", "site[status]"
    end
  end
end
