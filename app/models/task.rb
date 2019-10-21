class Task < ApplicationRecord
   belongs_to :user, optional: true
   has_many :comments
   has_many :users, through: :comments

   accepts_nested_attributes_for :comments, reject_if: proc { |attributes| attributes['content'].blank? }




end
