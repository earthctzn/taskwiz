class SessionsController < ApplicationController

  def new
   
  end
  
  def create

    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      log_in(@user)
      flash[:yay] = "Hey now, welcome #{@user.name}!"
      redirect_to new_user_task_path(current_user)
    else
      flash[:snap] = "Looks like there was an issue with your login..."
      render 'sessions/new'
    end
  
 
  end

  def fbauth
    user = User.from_facebook(auth)
    if user
      flash[:yay] = "Hey now, welcome #{user.name}!"
      log_in(user)
      redirect_to new_user_task_path(current_user)
    else
      flash[:snap] = "Looks like there was an issue with your login..."
      render "welcome/home"
    end

  end
  

  def destroy
    logout
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  
  def session_params
    params.permit(:name, :email, :password, :password_confirmation, :admin, :uid)
  end



end
