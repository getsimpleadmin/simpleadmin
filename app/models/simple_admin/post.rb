module SimpleAdmin
  class Post < Base
    translates :title, :description

    belongs_to :user, optional: true

    has_and_belongs_to_many :categories

    mount_uploader :image, ResourceImageUploader

    def self.plural_name
      :posts
    end

    def self.singular_name
      :post
    end
  end
end
