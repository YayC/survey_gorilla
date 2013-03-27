class Picture < ActiveRecord::Base
  belongs_to :question
  mount_uploader :image, ImageUploader

end
