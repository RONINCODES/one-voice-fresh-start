class ChangeFieldComments < ActiveRecord::Migration[5.1]
  def up
    add_column :comments, :class_session_id, :integer
    remove_column :comments, :class_sessions_id
  end

  def down
    add_column :comments, :class_sessions_id, :integer
    remove_column :comments, :class_session_id
  end

end
