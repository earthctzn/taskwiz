class User < ApplicationRecord
  has_secure_password

  has_many :tasks
  has_many :comments
  has_many :commented_tasks, through: :comments, source: :task

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true, on: :create
end
