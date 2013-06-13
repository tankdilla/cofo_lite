require "spec_helper"

describe WordNotesController do
  describe "routing" do

    it "routes to #index" do
      get("/word_notes").should route_to("word_notes#index")
    end

    it "routes to #new" do
      get("/word_notes/new").should route_to("word_notes#new")
    end

    it "routes to #show" do
      get("/word_notes/1").should route_to("word_notes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/word_notes/1/edit").should route_to("word_notes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/word_notes").should route_to("word_notes#create")
    end

    it "routes to #update" do
      put("/word_notes/1").should route_to("word_notes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/word_notes/1").should route_to("word_notes#destroy", :id => "1")
    end

  end
end
