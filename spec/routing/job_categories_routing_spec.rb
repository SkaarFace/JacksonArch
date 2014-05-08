require "spec_helper"

describe JobCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/job_categories").should route_to("job_categories#index")
    end

    it "routes to #new" do
      get("/job_categories/new").should route_to("job_categories#new")
    end

    it "routes to #show" do
      get("/job_categories/1").should route_to("job_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/job_categories/1/edit").should route_to("job_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/job_categories").should route_to("job_categories#create")
    end

    it "routes to #update" do
      put("/job_categories/1").should route_to("job_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/job_categories/1").should route_to("job_categories#destroy", :id => "1")
    end

  end
end
