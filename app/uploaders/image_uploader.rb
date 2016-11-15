# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :convert => 'png'
  process :tags => ["photo_contact"]
  ## save image local
  # storage :file

  version :standard do
    process :eager => true
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    eager
    resize_to_fit(150, 150)
    cloudinary_transformation :quality => 80
  end

  ## change locatization where file is save
  # def store_dir
  #   'app/assets/images/uploads/contact'
  # end
  #
  # def cache_dir
  #   'app/assets/images/uploads/contact/tmp'
  # end

  ## define default image name
  # def public_id
  #   return model.firstname
  # end

end
