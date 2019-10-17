class User < ApplicationRecord
  has_secure_password

  has_many :tasks
  has_many :comments
  has_many :commented_tasks, through: :comments, source: :task

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true, on: :create


  def self.from_facebook(auth)
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      @upass = Sysrandom.hex(32)
      u.password = @upass
      u.password_confirmation = @upass
    end

    log_in(@user)
    redirect_to new_task_pathß
  end
end
