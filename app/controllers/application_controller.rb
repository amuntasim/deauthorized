class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :layout_by_resource
  before_action :configure_permitted_parameters, if: :devise_controller?


  private

  #   # override the devise helper to store the current location so we can
  #   # redirect to it after loggin in or out. This override makes signing in
  #   # and signing up work automatically.

  def layout_by_resource
    if user_signed_in?
      'user'
    else
      'application'
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:subdomain])
  end

end
