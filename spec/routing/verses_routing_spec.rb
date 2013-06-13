require "spec_helper"

describe VersesController do
  describe "routing" do

    it "routes to #index" do
      get("/verses").should route_to("verses#index")
    end

    it "routes to #new" do
      get("/verses/new").should route_to("verses#new")
    end

    it "routes to #show" do
      get("/verses/1").should route_to("verses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/verses/1/edit").should route_to("verses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/verses").should route_to("verses#create")
    end

    it "routes to #update" do
      put("/verses/1").should route_to("verses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/verses/1").should route_to("verses#destroy", :id => "1")
    end

  end
end
