class TasksController < ApplicationController
  before_action :admin?, except: [:index, :show]
  def new
  end

  def create
  end

  def index
  end

  def edit
  end

  def show
  end
end
