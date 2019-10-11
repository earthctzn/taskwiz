class ApplicationController < ActionController::Base

  helper_method :current_user

  def logged_in?
    redirect_to '/' if !current_user
  end

  def admin?
    redirect_to users_path if !current_user.admin
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end


end
