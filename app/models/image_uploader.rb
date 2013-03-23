class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  
  # process :resize_to_fill => [300,nil]
  
  version :gallery do 
    process :resize_to_fill => [300,200]
  end

  version :thumb do 
    process :resize_to_fill => [150,100]
  end

  version :mini_thumb do 
    process :resize_to_fill => [75,50]
  end

  storage :file 
end
