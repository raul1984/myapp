class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :store_current_location, :unless => :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?


  # redirected to the homepage and flash error appears
  rescue_from CanCan::AccessDenied do |exception|
   redirect_to main_app.root_url, :alert => exception.message
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:first_name, :last_name, :email, :password)
    end
  end

  private
  # override the devise helper to store the current location so we can
  # redirect to it after loggin in or out. This override makes signing in
  # and signing up work automatically.
  def store_current_location
    store_location_for(:user, request.url)
  end
  
end
