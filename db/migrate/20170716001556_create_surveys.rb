class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table :surveys do |t|

      t.timestamps
    end
  end
end
