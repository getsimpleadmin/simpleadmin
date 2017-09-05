module SimpleAdmin
  class Category < Base
    extend FriendlyId

    friendly_id :title, use: :slugged

    has_many :posts

    mount_uploader :image, ResourceImageUploader
  end
end
