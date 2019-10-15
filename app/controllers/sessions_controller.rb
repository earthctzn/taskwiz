class SessionsController < ApplicationController

  def new
  end
  
  def create
    @upass = Sysrandom.hex(32)
    if !auth[:uid].nil?
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = @upass
        u.password_confirmation = @upass
      end
      log_in
      redirect_to 'users/index'
      if @user.errors.any?
        raise @user.errors.full_messages
      end
    else
      @user = User.new(session_params)
      log_in
      if @user.save
        redirect_to new_task_path
      else
        redirect_to root_path
      end
    end
    
    
  end
  

  def destroy
    session.clear
    redirect_to new_session_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  
  def session_params
    params.permit(:name, :email, :password, :password_confirmation, :admin, :uid)
  end

  def log_in
    session[:user_id] = @user.id
  end

end
