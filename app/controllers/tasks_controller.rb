class TasksController < ApplicationController
  before_action :redirect_admin, except: [:index, :show]
  def new
  end

  def create
    @task = Task.create(task_params)
    redirect_to task_path(@task)
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
    @task = Task.find_by(id: params[:id])
  end

  private

  def task_params
    params.permit(:title, :description, :status)
  end
end

