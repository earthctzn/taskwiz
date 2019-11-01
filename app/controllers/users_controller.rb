class UsersController < ApplicationController
  before_action :authenticate, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    
    if User.find_by(email: user_params[:email])
      flash[:notice] = "Looks like you already have an account. Please log in to continue."
      redirect_to login_path
    else
     @user = User.new(user_params)
    
      if @user.save
        log_in(@user)
        flash[:yay] = "Hey now, welcome #{@user.name}!"
        redirect_to new_user_task_path(@user)
      else
        render "new"
      end

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
