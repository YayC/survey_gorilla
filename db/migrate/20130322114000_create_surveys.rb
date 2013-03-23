class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.integer  :creator_id
      t.string   :title
      t.text     :description
      t.string   :picture
      t.timestamps
    end
  end
end
