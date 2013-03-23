class Picture < ActiveRecord::Base
  belongs_to :survey
  mount_uploader :image, ImageUploader

end
