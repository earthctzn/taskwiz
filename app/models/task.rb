class Task < ApplicationRecord
   validates :title, presence: true
   validates :description, presence: true
   validates :status, presence: true

   belongs_to :user, optional: true
   has_many :comments
   has_many :users, through: :comments

   accepts_nested_attributes_for :comments, reject_if: proc { |attributes| attributes['content'].blank? }
   

   def self.to_do_tasks
      where(staus: "To do").order(updated_at: :desc)
   end

   def self.in_prog_tasks
      where(staus: "In Progress").order(updated_at: :desc)
   end

   def self.ar_tasks
      where(staus: "Awaiting Response").order(updated_at: :desc)
   end

   def self.done_tasks
      where(staus: "Done").order(updated_at: :desc)
   end

   def self.completed_today
      where(status: "Done").where(updated_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).order(updated_at: :desc)
   end

end
