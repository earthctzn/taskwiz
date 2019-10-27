module UsersHelper

  def task_count
    @count = self.tasks.count
  end
end
