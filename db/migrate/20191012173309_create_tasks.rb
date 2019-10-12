class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :status
      t.datetime :date

      t.timestamps
    end
  end
end
