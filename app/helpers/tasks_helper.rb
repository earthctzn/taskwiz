module TasksHelper

  def all_tasks
    @tasks = Task.all
  end

end
