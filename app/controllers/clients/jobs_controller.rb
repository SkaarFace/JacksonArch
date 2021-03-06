class Clients::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  before_filter :set_client
  respond_to :html, :xml, :json


  def load_client
    @client = Client.find(params[:client_id]) if params[:client_id].present?
  end


  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = @client.jobs
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = @client.jobs.build
    respond_with(@job)
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @user = current_user
    puts @user.client.id
    @job = Job.new(job_params)
    @job.client_id = @user.client.id

    respond_to do |format|
      if @job.save
        format.html { redirect_to [@client, @job], notice: 'Job was successfully created.' }
        format.json { render action: 'show', status: :created, location: @job }
      else
        format.html { render action: 'new' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to [@client, @job], notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to client_jobs_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:client_id])
    end

    def set_job
      @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:client_id, :job_type_id, :contract_id,
        :client_location_id, :user_id)
    end
end
