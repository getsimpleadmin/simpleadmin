module SimpleAdmin
  class Category < Base
    translates :title

    belongs_to :post, optional: true

    def self.plural_name
      :categories
    end
  end
end
