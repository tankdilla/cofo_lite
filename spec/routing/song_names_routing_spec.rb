require "spec_helper"

describe SongNamesController do
  describe "routing" do

    it "routes to #index" do
      get("/song_names").should route_to("song_names#index")
    end

    it "routes to #new" do
      get("/song_names/new").should route_to("song_names#new")
    end

    it "routes to #show" do
      get("/song_names/1").should route_to("song_names#show", :id => "1")
    end

    it "routes to #edit" do
      get("/song_names/1/edit").should route_to("song_names#edit", :id => "1")
    end

    it "routes to #create" do
      post("/song_names").should route_to("song_names#create")
    end

    it "routes to #update" do
      put("/song_names/1").should route_to("song_names#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/song_names/1").should route_to("song_names#destroy", :id => "1")
    end

  end
end
