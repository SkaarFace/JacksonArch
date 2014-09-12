class RecruiterProfilesController < ApplicationController
  before_action :set_recruiter_profile, only: [:show, :edit, :update]
  before_filter :authenticate_user!


  # GET /recruiter_profiles
  # GET /recruiter_profiles.json
  def index
    @recruiter_profiles = RecruiterProfile.all
  end

  # GET /recruiter_profiles/1
  # GET /recruiter_profiles/1.json
  def show
  end

  # GET /recruiter_profiles/1/edit
  def edit
  end

  # PATCH/PUT /recruiter_profiles/1
  # PATCH/PUT /recruiter_profiles/1.json
  def update
    respond_to do |format|
      if @recruiter_profile.update(recruiter_profile_params)
        format.html { redirect_to @recruiter_profile, notice: 'RecruiterProfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @recruiter_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_recruiter_profile
      if params[:id]
        @recruiter_profile = RecruiterProfile.find(params[:id])
      else
        @recruiter_profile = RecruiterProfile.find(current_user.profile_id)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recruiter_profile_params
      params.require(:recruiter_profile).permit(:first_name, :last_name,
        :middle_initial, :phone_number, :address_line_1, :address_line_2, 
        :city, :state, :zip_code, :profile_picture)
    end
end
