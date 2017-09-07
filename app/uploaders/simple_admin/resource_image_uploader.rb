module SimpleAdmin
  class ResourceImageUploader < BaseUploader
    version :admin_collection_thumb do
      process resize_and_pad: [150, 110]
    end
  end
end
