require 'spec_helper'

describe "LookingForJobs" do
  describe "GET /looking_for_jobs" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get looking_for_jobs_path
      response.status.should be(200)
    end
  end
end
