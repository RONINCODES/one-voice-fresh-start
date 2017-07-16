class Users < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :role
      t.integer :class_sessions_id

      t.timestamps
    end
  end
end
