require "spec_helper"

describe VarnishServersController do
  describe "routing" do

    it "routes to #index" do
      get("/varnish_servers").should route_to("varnish_servers#index")
    end

    it "routes to #new" do
      get("/varnish_servers/new").should route_to("varnish_servers#new")
    end

    it "routes to #show" do
      get("/varnish_servers/1").should route_to("varnish_servers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/varnish_servers/1/edit").should route_to("varnish_servers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/varnish_servers").should route_to("varnish_servers#create")
    end

    it "routes to #update" do
      put("/varnish_servers/1").should route_to("varnish_servers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/varnish_servers/1").should route_to("varnish_servers#destroy", :id => "1")
    end

  end
end
