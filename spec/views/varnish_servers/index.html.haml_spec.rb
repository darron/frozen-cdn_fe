require 'spec_helper'

describe "varnish_servers/index" do
  before(:each) do
    assign(:varnish_servers, [
      stub_model(VarnishServer,
        :title => "Title",
        :region => "Region",
        :ip => "Ip"
      ),
      stub_model(VarnishServer,
        :title => "Title",
        :region => "Region",
        :ip => "Ip"
      )
    ])
  end

  it "renders a list of varnish_servers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Region".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Ip".to_s, :count => 2
  end
end
