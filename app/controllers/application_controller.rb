class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_staff_login

private 

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_staff_login
    redirect_to '/' unless staff_logged_in
  end

  def staff_logged_in
   return current_user && current_user.email && current_user.email.end_with?("devbootcamp.com")
  end
  
  helper_method :current_user, :staff_logged_in
end
