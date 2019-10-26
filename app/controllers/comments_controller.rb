class CommentsController < ApplicationController
  before_action :authenticate

  def new
    binding.pry 
    if params[:user_id]
      @task = Task.find(params[:task_id])
      @user = current_user
      @comment = @task.comments.new
    else
      @comment = Comment.new
    end
  end
  
  def create
    binding.pry
    if params[:comment]
      @user = current_user
      @user.comments.new(comment_params)
  
      if @comment.save
        flash[:notice] = "Comment successfully created."
        redirect_to task_path(@task.id)
      end
      
    else
      @comment = Comment.create(comment_params)
      flash[:notice] = "Comment successfully created."
      redirect_to task_path(@task.id)
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
      @user = User.find(params[:user_id])
      @task = @user.tasks.find(params[:task_id])
      @comment = @user.comments.find(params[:id])
    else
      @comment = Comment.find_by(id: params[:id])
    end
  end

  def edit
    if params[:user_id]
      @comment = Comment.find(params[:id])
    else
      
    end
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
