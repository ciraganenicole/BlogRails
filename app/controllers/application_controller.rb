class ApplicationController < ActionController::Base
  #protect_from_forgery with: :exception
   protect_from_forgery unless: -> { request.format.json? }

  before_action :update_allowed_parameters, if: :devise_controller?
  #==
  before_action :authenticate_user!

  # rescue_from CanCan::AccessDenied do |exception|
  #   respond_to do |format|
  #     format.json { head :forbidden, content_type: 'text/html' }
  #     format.html { redirect_back fallback_location: root_path, notice: exception.message }
  #     format.js { head :forbidden, content_type: 'text/html' }
  #   end
  # end
  #==

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password) }
  end
end