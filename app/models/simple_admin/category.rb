module SimpleAdmin
  class Category < Base
    has_many :posts

    validates :title, presence: true

    mount_uploader :image, ResourceImageUploader
  end
end
