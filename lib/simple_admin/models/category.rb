module SimpleAdmin
  class Category < Base
    belongs_to :post, optional: true
  end
end
