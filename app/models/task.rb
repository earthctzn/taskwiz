class Task < ApplicationRecord
   belongs_to :user, optional: true
   has_many :comments
   has_many :users, through: :comments
end
