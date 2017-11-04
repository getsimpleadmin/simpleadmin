require 'singleton'

module SimpleAdmin
  class Config
    include Singleton

    attr_accessor :per_page, :menu_items, :route_items

    class << self
      def setup(&block)
        instance.menu_items  = []
        instance.route_items = []

        yield(instance)
      end

      def per_page
        instance.per_page
      end
    end

    def menu
      SimpleAdmin::Menu
    end
  end
end
