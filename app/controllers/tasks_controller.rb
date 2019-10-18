class TasksController < ApplicationController
  before_action :redirect_admin, except: [:index, :show]
  def new
    @user = current_user
    @task = @user.tasks.build
  end

  def create
    if params[:user_id]
      @task = Task.new(task_params)
      if @task.save
        redirect_to user_task_path(current_user, @task)
      else
        flash[:snap] = "That did not work. Try again."
        redirect_to new_user_task(current_user)
      end
    end
  end

  def index
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      if @user.nil?
        flash[:error] = "User not found"
        redirect_to users_path
      else
        @tasks = @user.tasks
      end
    else
      @tasks = Task.all
    end
  end

  def edit
    authenticate
    if params[:user_id]
      @user = User.find(params[:user_id])
      @task = @user.task
    else
      @task = Task.find_by(id: params[:id])
    end
  end

  def update
    authenticate
    if @task.update(task_params)
      redirect_to tasks_path
    else
      redirect_to edit_task_path
    end
  end

  def show
    if params[:user_id]
      @user = User.find_by(id: params[:user_id])
      @task = @user.tasks.find_by(id: params[:id])
      if @task.nil?
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
    params.permit(:title, :description, :status, :comments => [])
  end
end

