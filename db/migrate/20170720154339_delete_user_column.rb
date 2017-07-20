class DeleteUserColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :class_sessions_id, :integer
  end
end
