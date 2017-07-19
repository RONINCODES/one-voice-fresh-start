class ChangeColumninClassSessions < ActiveRecord::Migration[5.1]
  def change
    add_column :class_sessions, :class_room_id, :integer
    remove_column :class_sessions, :class_room_id
  end
end
