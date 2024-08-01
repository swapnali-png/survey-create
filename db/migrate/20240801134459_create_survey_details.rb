class CreateSurveyDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :survey_details do |t|
      t.text :coordinates
      t.references :survey, foreign_key: true

      t.timestamps
    end
  end
end
