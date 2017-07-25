class AddUserColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :user_image, :string
  end
end
