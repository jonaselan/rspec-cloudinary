# encoding: utf-8

class VideoUploader < CarrierWave::Uploader::Base

  include Cloudinary::CarrierWave

  process :convert => 'mp4'
  process :tags => ["video_contact"]
  process encode_video: [:mp4, callbacks: { after_transcode: :set_success } ]

  version :standard do
    process :eager => true
    process :resize_to_fill => [100, 150, :north]
  end

  version :thumbnail do
    eager
    resize_to_fit(50, 50)
    cloudinary_transformation :quality => 80
  end


end
