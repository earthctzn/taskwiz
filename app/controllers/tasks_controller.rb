class TasksController < ApplicationController
  before_action :redirect_admin, except: [:index, :show]
  def new
  end

  def create
    @task = Task.create(task_params)
    redirect_to task_path
  end

  def index
    @tasks = Task.all
  end

  def edit
    @task = Task.find_by(id: params[:id])
  end

  def update
    @task = Task.find_by(id: params[:id])
    @task.update(task_params)
    if @task.valid?
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

