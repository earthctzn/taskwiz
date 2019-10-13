module UsersHelper

  def user_list
    @users = User.all
  end

  def task_count
    @count = self.tasks.count
  end
end
