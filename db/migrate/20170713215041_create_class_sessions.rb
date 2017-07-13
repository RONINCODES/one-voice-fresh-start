class CreateClassSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :class_sessions do |t|
      t.date :date
      t.integer :classroom_id
      t.text :agenda

      t.timestamps
    end
  end
end