class RemoveSurveyReferencesFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :survey_id
  end
end
