class CommentsController < ApplicationController

  def new
    if params[:user_id]
      @comment = User.comments.build
    else
      @comment = Comment.new
    end
  end
  
  def create
    if params[:user_id]
      @user = current_user
      # binding.pry
      @comment = @user.comments.new(comment_params)
      @task = Task.find(params[:id])
      if @comment.save
        flash[:notice] = "Comment successfully created."
        redirect_to task_path(@task)
      end
    else
      @comment = Comment.create(comment_params)
      flash[:notice] = "Comment successfully created."
      redirect_to task_path(@task)
    end
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
    if params[:user_id]
      @user = User.find(comment_params[:user_id])
      @task = @user.tasks.find(comment_params[:task_id])
      @comment = @user.comments.find(params[:id])
    else
      @comment = Comment.find_by
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment successfully deleted."
    redirect_to user_tasks_path(current_user)
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :user_id, :task_id)
  end

end
