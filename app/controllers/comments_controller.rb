class CommentsController < ApplicationController
  before_action :authenticate

  def new

    if params[:user_id] || params[:task_id]
      @task = Task.find(params[:task_id])
      @user = current_user
      @comment = @task.comments.new
    else
      @comment = Comment.new
    end
  end
  
  def create
   
    if params[:comment]
      @user = current_user
      @task = Task.find(params[:task_id]) 
      @new_comment = @user.comments.new(comment_params)
      
      if @new_comment.save
        flash[:notice] = "Comment successfully created."
        redirect_to task_comment_path(@task.id, @new_comment.id)
      end

    else
      @comment = Comment.create(comment_params)
      flash[:notice] = "Comment successfully created."
      redirect_to task_comment_path(@task.id, @comment.id)
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

    if params[:user_id] || params[:task_id]
      @user = current_user
      @task = Task.find(params[:task_id])
      @comment = @user.comments.find(params[:id])
    else
      @comment = Comment.find_by(id: params[:id])
    end
  end

  def edit
    
    if params[:user_id] || params[:task_id]
      @comment = Comment.find(params[:id])
      @task = Task.find(params[:task_id])
      @user = current_user
    else
      @comment = Comment.find(params[:id])
    end
  end

  def update
  
    if params[:user_id] || params[:task_id]
      @comment = Comment.find(params[:id])
      @task = Task.find(params[:task_id])
    
      if @comment.update(comment_params)
        flash[:notice] = "Comment successfully updated"
        redirect_to task_comment_path(@task.id, @comment.id)
      else
        flash[:warning] = "That didn't work. Please try again."
        redirect_to task_comment_path(@task.id, @comment.id)
      end
    else
      @comment = Comment.find(params[:id])
    end
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
