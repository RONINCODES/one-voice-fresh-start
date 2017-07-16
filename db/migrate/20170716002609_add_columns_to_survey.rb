class AddColumnsToSurvey < ActiveRecord::Migration[5.1]
  def change
    add_column :surveys, :helpfulness, :string
    add_column :surveys, :clarity, :string
    add_column :surveys, :pace, :string
    add_column :surveys, :suggestions, :text
    add_column :surveys, :users_id, :integer
    add_column :surveys, :class_sessions_id, :integer


  end
end
