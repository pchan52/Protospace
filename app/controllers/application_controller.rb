class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :works, :profile, :avatar, :member])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :works, :profile, :avatar, :member])
  end

  # sign_outしたあとsign_in画面にリダイレクト
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
end
