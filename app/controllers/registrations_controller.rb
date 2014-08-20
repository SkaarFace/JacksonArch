class RegistrationsController < Devise::RegistrationsController
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, 
      :password, :password_confirmation, {:role_ids => []})}
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit( 
      :email, :password, :password_confirmation, :current_password, 
      {:role_ids => []})}
  end

end
