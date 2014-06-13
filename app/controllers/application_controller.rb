class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :require_user, :set_wedding, :current_user
  
private
  def current_user
    @current_user ||= Attendee.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_user
    unless current_user
        flash.now.alert = "Invalid email or password"
        redirect_to root_path
    end
  end

  def set_wedding
    @wedding = current_user.wedding if current_user
  end

end
