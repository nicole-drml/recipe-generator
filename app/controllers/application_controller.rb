class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?


  protected
  def after_sign_in_path_for(resource)
    dashboard_path
  end
  
  # def after_register_path_for(resource)
  #   new_user_session_path
  # end

  def configure_permitted_parameters
    attributes = [:first_name, :last_name, :email, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

end
