module SimpleAdmin
  class ResourceImageUploader < BaseUploader
    version :collection_thumb do
      process resize_and_pad: [46, 46]
    end
  end
end
