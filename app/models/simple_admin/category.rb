module SimpleAdmin
  class Category < Base
    has_many :posts

    mount_uploader :image, ResourceImageUploader
  end
end
