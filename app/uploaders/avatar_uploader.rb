class AvatarUploader < BaseUploader
  version :thumb do
    process resize_and_pad: [64, 64]
  end
end
