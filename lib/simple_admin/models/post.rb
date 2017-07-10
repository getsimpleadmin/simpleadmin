module SimpleAdmin
  class Post < Base
    has_many :categories
  end
end
