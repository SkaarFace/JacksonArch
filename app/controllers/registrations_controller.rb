class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def create
    build_resource(sign_up_params)

    if(sign_up_params[:profile_type] == "applicant")
      temp = ApplicantProfile.new
      temp.user = resource
      temp.save
    elsif(sign_up_params[:profile_type] == "recruiter")
      temp = RecruiterProfile.new
      temp.user = resource
      temp.save
    end

    resource_saved = resource.save

    logger.info sign_up_params

    yield resource if block_given?
    if resource_saved
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      @validatable = devise_mapping.validatable?
      if @validatable
        @minimum_password_length = resource_class.password_length.min
      end
      respond_with resource
    end
  end


  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, 
      :password, :password_confirmation, :profile_type)}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit( 
      :email, :password, :password_confirmation, :current_password, 
        :profile_type)}
  end

end
