require 'spec_helper'

describe "VarnishServers" do
  describe "GET /varnish_servers" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get varnish_servers_path
      response.status.should be(200)
    end
  end
end
