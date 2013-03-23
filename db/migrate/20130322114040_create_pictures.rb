class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :survey
      t.string :image
      t.timestamps
    end
  end
end
