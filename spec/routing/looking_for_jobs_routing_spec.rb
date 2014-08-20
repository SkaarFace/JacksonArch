require "spec_helper"

describe LookingForJobsController do
  describe "routing" do

    it "routes to #index" do
      get("/looking_for_jobs").should route_to("looking_for_jobs#index")
    end

    it "routes to #new" do
      get("/looking_for_jobs/new").should route_to("looking_for_jobs#new")
    end

    it "routes to #show" do
      get("/looking_for_jobs/1").should route_to("looking_for_jobs#show", :id => "1")
    end

    it "routes to #edit" do
      get("/looking_for_jobs/1/edit").should route_to("looking_for_jobs#edit", :id => "1")
    end

    it "routes to #create" do
      post("/looking_for_jobs").should route_to("looking_for_jobs#create")
    end

    it "routes to #update" do
      put("/looking_for_jobs/1").should route_to("looking_for_jobs#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/looking_for_jobs/1").should route_to("looking_for_jobs#destroy", :id => "1")
    end

  end
end
