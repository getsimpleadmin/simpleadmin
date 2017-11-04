module SimpleAdmin
  class Post < Base
    translates :title, :description

    has_many :categories

    def self.plural_name
      :posts
    end
  end
end
