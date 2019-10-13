class UsersController < ApplicationController
  def new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to new_task_path
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
    @user = current_user
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
