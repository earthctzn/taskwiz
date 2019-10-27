class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to new_user_task_path(@user)
    else
      flash[:snap] = "Looks like there was an issue with your signup..."
      render 'new'
    end
  end

  def index
    @users = User.all
  end

  def show
    get_user
  end

  def edit
    get_user
  end

  def update
    get_user
    @user.update(user_params)
    if @user.valid?
      redirect_to users_path
    else
      flash[:snap] = "Account not updated..."
      render 'edit'
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def get_user
    @user = User.find_by(id: params[:id])
  end

end
