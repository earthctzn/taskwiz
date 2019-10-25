class CommentsController < ApplicationController

  def new
  end
  
  def create
    if params[:user_id]
      @user = current_user
      binding.pry
      @comment = @user.comments.new(comment_params)
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
    self.destroy
  end

  private

  def comment_params
    params.require(comment).permit(:content, :user_id, :task_id)
  end

end
