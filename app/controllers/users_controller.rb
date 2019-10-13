class UsersController < ApplicationController
  def new
  end

  def create
    if params[:user]
      @user = User.create(params[:user])
    else
      @user = User.new(user_params)
      if @user.d
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

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit
    logged_in?
    @user = current_user

  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    if @user.valid?
      redirect_to users_path
    else
      redirect_to edit_user_path
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
