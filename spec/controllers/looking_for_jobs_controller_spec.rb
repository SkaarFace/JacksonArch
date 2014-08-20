require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe LookingForJobsController do

  # This should return the minimal set of attributes required to create a valid
  # LookingForJob. As you add validations to LookingForJob, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # LookingForJobsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all looking_for_jobs as @looking_for_jobs" do
      looking_for_job = LookingForJob.create! valid_attributes
      get :index, {}, valid_session
      assigns(:looking_for_jobs).should eq([looking_for_job])
    end
  end

  describe "GET show" do
    it "assigns the requested looking_for_job as @looking_for_job" do
      looking_for_job = LookingForJob.create! valid_attributes
      get :show, {:id => looking_for_job.to_param}, valid_session
      assigns(:looking_for_job).should eq(looking_for_job)
    end
  end

  describe "GET new" do
    it "assigns a new looking_for_job as @looking_for_job" do
      get :new, {}, valid_session
      assigns(:looking_for_job).should be_a_new(LookingForJob)
    end
  end

  describe "GET edit" do
    it "assigns the requested looking_for_job as @looking_for_job" do
      looking_for_job = LookingForJob.create! valid_attributes
      get :edit, {:id => looking_for_job.to_param}, valid_session
      assigns(:looking_for_job).should eq(looking_for_job)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new LookingForJob" do
        expect {
          post :create, {:looking_for_job => valid_attributes}, valid_session
        }.to change(LookingForJob, :count).by(1)
      end

      it "assigns a newly created looking_for_job as @looking_for_job" do
        post :create, {:looking_for_job => valid_attributes}, valid_session
        assigns(:looking_for_job).should be_a(LookingForJob)
        assigns(:looking_for_job).should be_persisted
      end

      it "redirects to the created looking_for_job" do
        post :create, {:looking_for_job => valid_attributes}, valid_session
        response.should redirect_to(LookingForJob.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved looking_for_job as @looking_for_job" do
        # Trigger the behavior that occurs when invalid params are submitted
        LookingForJob.any_instance.stub(:save).and_return(false)
        post :create, {:looking_for_job => {  }}, valid_session
        assigns(:looking_for_job).should be_a_new(LookingForJob)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        LookingForJob.any_instance.stub(:save).and_return(false)
        post :create, {:looking_for_job => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested looking_for_job" do
        looking_for_job = LookingForJob.create! valid_attributes
        # Assuming there are no other looking_for_jobs in the database, this
        # specifies that the LookingForJob created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        LookingForJob.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => looking_for_job.to_param, :looking_for_job => { "these" => "params" }}, valid_session
      end

      it "assigns the requested looking_for_job as @looking_for_job" do
        looking_for_job = LookingForJob.create! valid_attributes
        put :update, {:id => looking_for_job.to_param, :looking_for_job => valid_attributes}, valid_session
        assigns(:looking_for_job).should eq(looking_for_job)
      end

      it "redirects to the looking_for_job" do
        looking_for_job = LookingForJob.create! valid_attributes
        put :update, {:id => looking_for_job.to_param, :looking_for_job => valid_attributes}, valid_session
        response.should redirect_to(looking_for_job)
      end
    end

    describe "with invalid params" do
      it "assigns the looking_for_job as @looking_for_job" do
        looking_for_job = LookingForJob.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LookingForJob.any_instance.stub(:save).and_return(false)
        put :update, {:id => looking_for_job.to_param, :looking_for_job => {  }}, valid_session
        assigns(:looking_for_job).should eq(looking_for_job)
      end

      it "re-renders the 'edit' template" do
        looking_for_job = LookingForJob.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        LookingForJob.any_instance.stub(:save).and_return(false)
        put :update, {:id => looking_for_job.to_param, :looking_for_job => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested looking_for_job" do
      looking_for_job = LookingForJob.create! valid_attributes
      expect {
        delete :destroy, {:id => looking_for_job.to_param}, valid_session
      }.to change(LookingForJob, :count).by(-1)
    end

    it "redirects to the looking_for_jobs list" do
      looking_for_job = LookingForJob.create! valid_attributes
      delete :destroy, {:id => looking_for_job.to_param}, valid_session
      response.should redirect_to(looking_for_jobs_url)
    end
  end

end
