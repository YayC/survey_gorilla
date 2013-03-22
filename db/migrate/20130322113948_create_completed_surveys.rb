class CreateCompletedSurveys < ActiveRecord::Migration
  def change
    create_table :completed_surveys do |t|
      t.integer  :user_id
      t.integer  :survey_id
      t.timestamps
    end
  end
end
