class ApplicationController < ActionController::Base

  helper_method :current_user
  helper_method :logged_in?
  helper_method :not_found

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found
  rescue_from ActionController::RoutingError, :with => :not_found

  private

  def not_found
    render(:file => File.join(Rails.root, 'public/404.html'),  :status => 404, :layout => false)
  end

  def logged_in?
    current_user 
  end

  def authenticate
    redirect_to root_path if !logged_in?
  end
  
  def log_in(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
    @current_user = nil
  end


  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end




end
