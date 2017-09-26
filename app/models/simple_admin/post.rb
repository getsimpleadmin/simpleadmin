module SimpleAdmin
  class Post < Base
    belongs_to :user
    belongs_to :category, optional: true

    has_many :comments

    validates :title, :description, presence: true

    mount_uploader :image, ResourceImageUploader
  end
end
