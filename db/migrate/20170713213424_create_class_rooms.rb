class CreateClassRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :class_rooms do |t|
      t.string :subject
      t.integer :group_code
      t.integer :user_id

      t.timestamps
    end
  end
end
