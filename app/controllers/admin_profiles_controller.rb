class AdminProfilesController < ApplicationController
  before_action :set_admin_profile, only: [:show, :edit, :update]
  before_filter :authenticate_user!


  # GET /admin_profiles
  # GET /admin_profiles.json
  def index
    @admin_profiles = AdminProfile.all
  end

  # GET /admin_profiles/1
  # GET /admin_profiles/1.json
  def show
  end
  
  # GET /admin_profiles/1/edit
  def edit
  end

  # PATCH/PUT /admin_profiles/1
  # PATCH/PUT /admin_profiles/1.json
  def update
    respond_to do |format|
      if @admin_profile.update(admin_profile_params)
        format.html { redirect_to @admin_profile, notice: 'AdminProfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_profile
      if params[:id]
        @admin_profile = AdminProfile.find(params[:id])
      else
        @admin_profile = AdminProfile.find(current_user.profile_id)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_profile_params
      params.require(:admin_profile).permit(:first_name, :last_name,
        :middle_initial, :phone_number)
    end
end
