class ChangeFieldComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :class_session_id, :integer
    remove_column :comments, :class_sessions_id
  end
end
