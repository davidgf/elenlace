class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :require_user, :set_wedding, :current_attendee, :require_admin
  
private
  def current_attendee
    @current_attendee ||= Attendee.find_by_auth_token(cookies[:auth_token]) if cookies[:auth_token]
  end

  def require_user
    unless current_attendee
        flash.now.alert = "Contraseña incorrecta"
        redirect_to log_in_path
    end
  end

  def require_admin_user
    unless current_user
      redirect_to admin_log_in_path
    end
  end

  def set_wedding
    @wedding = current_attendee.wedding if current_attendee
  end

  def current_ability
    @current_ability ||= Ability.new(current_attendee)
  end
end
