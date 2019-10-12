class SessionsController < ApplicationController

  def new
  end
  
  def create
  end

  def destroy
    session.clear
    redirect_to new_session_path
  end

end
