require 'spec_helper'

describe "websites/new" do
  before(:each) do
    assign(:website, stub_model(Website,
      :url => "MyString",
      :ttl => 1,
      :active => false,
      :paid => false,
      :user_id => 1
    ).as_new_record)
  end

  it "renders new website form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => websites_path, :method => "post" do
      assert_select "input#website_url", :name => "website[url]"
      assert_select "input#website_ttl", :name => "website[ttl]"
      assert_select "input#website_active", :name => "website[active]"
      assert_select "input#website_paid", :name => "website[paid]"
      assert_select "input#website_user_id", :name => "website[user_id]"
    end
  end
end
