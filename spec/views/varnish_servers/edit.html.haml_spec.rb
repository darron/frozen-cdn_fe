require 'spec_helper'

describe "varnish_servers/edit" do
  before(:each) do
    @varnish_server = assign(:varnish_server, stub_model(VarnishServer,
      :title => "MyString",
      :region => "MyString",
      :ip => "MyString"
    ))
  end

  it "renders the edit varnish_server form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => varnish_servers_path(@varnish_server), :method => "post" do
      assert_select "input#varnish_server_title", :name => "varnish_server[title]"
      assert_select "input#varnish_server_region", :name => "varnish_server[region]"
      assert_select "input#varnish_server_ip", :name => "varnish_server[ip]"
    end
  end
end
