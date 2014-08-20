class LookingForJobsController < ApplicationController
  before_action :set_looking_for_job, only: [:show, :edit, :update, :destroy]
  before_action :get_context, only: [:index]

  # GET /looking_for_jobs
  # GET /looking_for_jobs.json
  def index
  end

  # GET /looking_for_jobs/1
  # GET /looking_for_jobs/1.json
  def show
  end

  # GET /looking_for_jobs/new
  def new
    @looking_for_job = LookingForJob.new
  end

  # GET /looking_for_jobs/1/edit
  def edit
  end

  # POST /looking_for_jobs
  # POST /looking_for_jobs.json
  def create
    @looking_for_job = LookingForJob.new(looking_for_job_params)

    respond_to do |format|
      if @looking_for_job.save
        format.html { redirect_to @looking_for_job, notice: 'Looking for job was successfully created.' }
        format.json { render action: 'show', status: :created, location: @looking_for_job }
      else
        format.html { render action: 'new' }
        format.json { render json: @looking_for_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /looking_for_jobs/1
  # PATCH/PUT /looking_for_jobs/1.json
  def update
    respond_to do |format|
      if @looking_for_job.update(looking_for_job_params)
        format.html { redirect_to @looking_for_job, notice: 'Looking for job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @looking_for_job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /looking_for_jobs/1
  # DELETE /looking_for_jobs/1.json
  def destroy
    @looking_for_job.destroy
    respond_to do |format|
      format.html { redirect_to looking_for_jobs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_looking_for_job
      if params[:user_id]
        @user = User.find(params[:user_id])
        @looking_for_job = User.find(params[:user_id]).looking_for_job
      elsif params[:id]
        @looking_for_job = LookingForJob.find(params[:id])
        @user = @looking_for_job.user
      else
        @user = current_user
        @looking_for_job = current_user.looking_for_job
      end
    end

    def get_context
      if params[:user_id]
        @looking_for_jobs = User.find(params[:user_id]).looking_for_jobs.all
      else
        @looking_for_jobs = LookingForJob.all
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def looking_for_job_params
      params.require(:looking_for_job).permit(:job_category_id, :job_type_id,
        :max_distance, :qualified, :text)
    end
end
