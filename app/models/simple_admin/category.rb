module SimpleAdmin
  class Category < Base
    translates :title

    belongs_to :post, optional: true
  end
end
