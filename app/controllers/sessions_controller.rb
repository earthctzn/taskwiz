class SessionsController < ApplicationController

  def new
  end
  
  def create
    binding.pry
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
    end

    session[:user_id] = @user.id

    render 'welcome/home'
  end
  

  def destroy
    session.clear
    redirect_to new_session_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
  


end
