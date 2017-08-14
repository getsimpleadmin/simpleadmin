module SimpleAdmin
  class ResourceImageUploader < BaseUploader
    version :thumb do
      process resize_and_pad: [254, 254]
    end
  end
end
