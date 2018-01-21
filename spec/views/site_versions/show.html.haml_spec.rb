require 'rails_helper'

RSpec.describe "site_versions/show", type: :view do
  before(:each) do
    @site_version = assign(:site_version, SiteVersion.create!(
      :site_id => 2,
      :checksum => "Checksum",
      :body => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Checksum/)
    expect(rendered).to match(/MyText/)
  end
end
