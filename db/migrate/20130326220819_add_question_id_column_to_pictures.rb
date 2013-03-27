class AddQuestionIdColumnToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :question_id, :integer
  end
end
