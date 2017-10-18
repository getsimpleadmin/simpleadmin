require 'singleton'

module SimpleAdmin
  class Config
    include Singleton

    attr_accessor :per_page, :menu_items

    class << self
      def setup(&block)
        instance.menu_items  = []
        
        yield(instance)
      end

      def per_page
        instance.per_page
      end

      def menu_items
        instance.menu_items
      end
    end

    def menu
      SimpleAdmin::MenuDsl
    end
  end
end
