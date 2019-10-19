class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in(@user)
      redirect_to new_user_task_path(@user)
    else
      flash[:snap] = "Looks like there was an issue with your signup..."
      redirect_to new_user_path
    end
  end

  def index
    logged_in?
    @users = User.all
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
      flash[:snap] = "Account not updated..."
      redirect_to edit_user_path(@user)
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end
end
