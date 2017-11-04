module SimpleAdmin
  class Post < Base
    belongs_to :user
    belongs_to :category, optional: true

    mount_uploader :image, ResourceImageUploader
  end
end
