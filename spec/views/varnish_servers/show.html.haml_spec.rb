require 'spec_helper'

describe "varnish_servers/show" do
  before(:each) do
    @varnish_server = assign(:varnish_server, stub_model(VarnishServer,
      :title => "Title",
      :region => "Region",
      :ip => "Ip"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Region/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Ip/)
  end
end
