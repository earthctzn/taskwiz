class User < ApplicationRecord
  has_secure_password

  has_many :tasks
  has_many :comments, through: :tasks

  validates :name, presense: true
end
