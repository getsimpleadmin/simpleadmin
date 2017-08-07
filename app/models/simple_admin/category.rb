module SimpleAdmin
  class Category < Base
    translates :title

    belongs_to :post

    def self.plural_name
      :categories
    end

    def self.singular_name
      :category
    end
  end
end
