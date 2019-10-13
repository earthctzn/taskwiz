class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path
    else

      redirect_to new_user_path
    end
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
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.permit(:name, :email, :password, :admin)
  end
end
