module SimpleAdmin
  class Post < Base
    translates :title, :description

    has_many :categories
  end
end
