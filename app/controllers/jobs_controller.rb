class JobsController < ApplicationController

  def index
    @jobs = []

    near = ClientLocation.near([current_user.location.latitude, current_user.location.longitude], 20)
    near.each do |client_location|
      client_location.jobs.each do |job|
        puts job
        @jobs.push(job)
      end  
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    respond_to do |format|
      if @job.update(job_params)
        @job.applicants.push(current_user)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def job_params
      params.require(:job).permit(:client_id, :job_type_id, :contract_id,
        :client_location_id, :user_id)
    end
end
