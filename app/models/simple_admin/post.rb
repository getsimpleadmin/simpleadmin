module SimpleAdmin
  class Post < Base
    acts_as_taggable_on :tags

    belongs_to :user
    belongs_to :category, optional: true

    has_many :related_items, as: :object

    mount_uploader :image, ResourceImageUploader

    accepts_nested_attributes_for :related_items, update_only: true
  end
end
