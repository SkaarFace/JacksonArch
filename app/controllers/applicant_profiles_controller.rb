class ApplicantProfilesController < ApplicationController
  before_action :set_applicant_profile, only: [:show, :edit, :update]
  before_filter :authenticate_user!


  # GET /applicant_profiles
  # GET /applicant_profiles.json
  def index
    @applicant_profiles = ApplicantProfile.all
  end

  # GET /applicant_profiles/1
  # GET /applicant_profiles/1.json
  def show
  end

  # GET /applicant_profiles/1/edit
  def edit
  end

  # PATCH/PUT /applicant_profiles/1
  # PATCH/PUT /applicant_profiles/1.json
  def update
    respond_to do |format|
      if @applicant_profile.update(applicant_profile_params)
        format.html { redirect_to @applicant_profile, notice: 'ApplicantProfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @applicant_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant_profile
      if params[:id]
        @applicant_profile = ApplicantProfile.find(params[:id])
      else
        @applicant_profile = ApplicantProfile.find(current_user.profile_id)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def applicant_profile_params
      params.require(:applicant_profile).permit(:first_name, :last_name,
        :middle_initial, :phone_number, :address_line_1, :address_line_2, 
        :city, :state, :zip_code)
    end
end
