class ApplicationController < ActionController::Base

  helper_method :current_user

  def logged_in?
    current_user
  end

  def authenticate
    redirect_to '/' if !logged_in?
  end

  def redirect_admin
    #need to change this or create an actual admin path 
    redirect_to users_path if !current_user.admin
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end




end
