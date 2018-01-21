require 'rails_helper'

RSpec.describe "sites/edit", type: :view do
  before(:each) do
    @site = assign(:site, Site.create!(
      :name => "MyString",
      :url => "MyString",
      :site_versions_count => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit site form" do
    render

    assert_select "form[action=?][method=?]", site_path(@site), "post" do

      assert_select "input[name=?]", "site[name]"

      assert_select "input[name=?]", "site[url]"

      assert_select "input[name=?]", "site[site_versions_count]"

      assert_select "input[name=?]", "site[status]"
    end
  end
end
