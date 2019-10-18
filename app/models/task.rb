class Task < ApplicationRecord
   belongs_to :user, optional: true
   has_many :comments
   has_many :users, through: :comments

   accepts_nested_attributes_for :comments

   # def comments_attributes(comment)
   #    self.comment = Comment.find_or_create_by(comment_attributes)
   # end



end
