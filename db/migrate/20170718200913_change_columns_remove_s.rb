class ChangeColumnsRemoveS < ActiveRecord::Migration[5.1]
  def up
    add_column :class_sessions, :user_id, :integer
    remove_column :class_sessions, :users_id

    add_column :surveys, :user_id, :integer
    remove_column :surveys, :users_id
  end

  def down
    add_column :class_sessions, :users_id, :integer
    remove_column :class_sessions, :user_id

    add_column :surveys, :users_id, :integer
    remove_column :surveys, :user_id
  end
end
