class TasksController < ApplicationController
  before_action :authenticate
  # before_action :redirect_admin, except: [:index, :show]
  
  def new
    @task = current_user.tasks.build
    @task.comments.build
  end

  def create
    
    if params[:user_id]
      tps = task_params
      tps[:comments_attributes]["0"][:user_id] = current_user.id
      @task = current_user.tasks.build(tps)

      if @task.save
        redirect_to user_task_path(@task.user, @task)
      else

        flash[:snap] = "That did not work. Try again."
        redirect_to new_user_task_path(@task.user)
      end
    end

  end

  def index
    if params[:user_id]
      find_user
      @tasks = @user.tasks
    else
      @tasks = Task.all
    end
  end

  def edit
    if params[:user_id]
      find_user
      find_user_task
      current_user_comment
    else
      @task.find(params[:id])
    end
  end

  def update
    tps = task_params
    tps[:comments_attributes]["0"][:user_id] = current_user.id
    find_user
    find_user_task
    binding.pry
    if !@task.nil? && @task.update(tps)
      redirect_to user_tasks_path(@user)
    else
      redirect_to edit_user_task_path(@user, @task)
    end
  end

  def show
    if params[:user_id]
      find_user
      find_user_task
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

  def find_user_task
    @task = @user.tasks.find_by(id: params[:id])
  end

  def find_user
    @user = User.find(params[:user_id])
  end
  
end

