class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status
      t.string :description
      t.string :user_id

      t.timestamps
    end
  end
end
