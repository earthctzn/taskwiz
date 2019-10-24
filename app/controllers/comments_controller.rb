class CommentsController < ApplicationController

  def new
  end
  
  def create
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @tasks = @user.tasks
    else
      @comments = Comment.all
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    
  end

end
