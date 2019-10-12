class UsersController < ApplicationController
  def new
  end

  def create
    @user = user.new
  end

  def index
    logged_in?
    @user = User.all
  end

  def edit
    logged_in?
    current_user
  end

  def show
    @user = user.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :admin)
  end
end
