class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :users_id
      t.integer :class_sessions_id
      t.text :comment
      t.timestamps
    end
  end
end
