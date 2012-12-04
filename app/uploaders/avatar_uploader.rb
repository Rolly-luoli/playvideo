require 'carrierwave/orm/activerecord'
require 'carrierwave/processing/mime_types'

class AvatarUploader < CarrierWave::Uploader::Base

    include CarrierWave::MimeTypes
    include CarrierWave::RMagick
    storage :file    
    process :set_content_type  
          
    def store_dir
        'uploads'
     end
end
