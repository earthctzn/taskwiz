class User < ApplicationRecord
  has_secure_password

  has_many :tasks
  has_many :comments, through: :tasks

  validates :name, presense: true
  validates :email, uniqueness: true
  validates :password, presense: true
  validates :password_confirmation, presence: true, on: :create
end
s