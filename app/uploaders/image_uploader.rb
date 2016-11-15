# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave
  storage :file

  version :standard do
    process :eager => true
  end

end
