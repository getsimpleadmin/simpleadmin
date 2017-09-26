module SimpleAdmin
  class Comment < Base
    belongs_to :user
    belongs_to :post
  end
end
