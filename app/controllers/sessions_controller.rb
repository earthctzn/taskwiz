class SessionsController < ApplicationController

  def new
  end
  
  def create
    
    if auth && !auth[:uid].nil?
      @upass = Sysrandom.hex(32)
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
        u.email = auth['info']['email']
        u.password = @upass
        u.password_confirmation = @upass
      end
      log_in(@user)
      redirect_to users_path
      if @user.errors.any?
        raise @user.errors.full_messages
      end
    else
      @user = User.new(session_params)
      
      if @user.save
        log_in(@user)
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

  def log_in(user)
    session[:user_id] = user.id
  end

end
