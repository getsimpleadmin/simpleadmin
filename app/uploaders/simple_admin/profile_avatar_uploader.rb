module SimpleAdmin
  class ProfileAvatarUploader < BaseUploader
    version :thumb do
      process resize_and_pad: [64, 64]
    end

    version :admin_collection_thumb do
      process resize_and_pad: [150, 110]
    end
  end
end
