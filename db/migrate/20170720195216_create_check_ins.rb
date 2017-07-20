class CreateCheckIns < ActiveRecord::Migration[5.1]
  def change
    create_table :check_ins do |t|
      t.integer :class_session_id
      t.integer :user_id

      t.timestamps
    end
  end
end
