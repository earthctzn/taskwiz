class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
