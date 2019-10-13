class User < ApplicationRecord
  has_secure_password

  has_many :tasks
  has_many :comments, through: :tasks

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true, on: :create
end
