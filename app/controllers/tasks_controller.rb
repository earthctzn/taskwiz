class TasksController < ApplicationController
  before_action :authenticate
  # before_action :redirect_admin, except: [:index, :show]
  
  def new
    @task = current_user.tasks.build
    @task.comments.build
  end

  def create
    
    if params[:user_id]
      @task = Task.new(task_params)
      @task.user = current_user   
      if @task.save
        redirect_to user_task_path(@task.user, @task)
      else
        flash[:snap] = "That did not work. Try again."
        redirect_to new_user_task_path(current_user)
      end
    end
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @tasks = @user.tasks
    else
      @tasks = Task.all
    end
  end

  def edit
    if params[:user_id]
      @user = User.find(params[:user_id])
      @task = @user.tasks.find_by(id: params[:id])
      current_user_comment
    else
      @task = Task.find_by(id: params[:id])
    end
  end

  def update
    if !@task.nil? && @task.update(task_params)
      redirect_to tasks_path
    else
      redirect_to edit_user_task_path(current_user, @task)
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @task = @user.tasks.find_by(id: params[:id])
      current_user_comment
      if !@task
        flash[:error] = "Task not found"
        redirect_to tasks_path
      else
        @tasks = @user.tasks
      end
    else
      @task = Task.find(params[:id])
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :status, comments_attributes: [
      :content
    ])
  end

  def current_user_comment
    @comment = current_user.comments.find_by(id: params[:id])
  end
  
end

