class TasksController < ApplicationController
  before_action :redirect_admin, except: [:index, :show]
  def new
  end

  def create
    @task = Task.create(task_params)
  end

  def index
    @tasks = Task.all
  end

  def edit
    
  end

  def show
  end

  private

  def task_params
    params.permit(:title, :description, :status)
  end
end

