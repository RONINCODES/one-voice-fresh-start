class Users < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :class_sessions_id, :string
  end
end
