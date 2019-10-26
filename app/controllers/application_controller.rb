class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?

  def logged_in?
    current_user 
  end

  def authenticate
    redirect_to '/' if !logged_in?
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
    @current_user = nil
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end




end
