class ChangeSurveyColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :surveys, :class_sessions_id, :integer
    add_column :surveys, :class_session_id, :integer
  end
end
