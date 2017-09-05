module SimpleAdmin
  class Post < Base
    acts_as_taggable_on :tags

    belongs_to :user
    belongs_to :category, optional: true

    mount_uploader :image, ResourceImageUploader
  end
end
