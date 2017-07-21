class ChangeColumnCommentsUser < ActiveRecord::Migration[5.1]
  def up
    add_column :comments, :user_id, :integer
    remove_column :comments, :users_id
  end

  def down
    remove_column :comments, :user_id
    add_column :comments, :users_id, :integer
  end
end
