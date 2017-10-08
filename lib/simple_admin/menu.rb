require 'singleton'

module SimpleAdmin
  class Menu
    include Singleton

    attr_accessor :items

    class << self
      def configure(&block)
        self.instance.items = []
        instance_eval &block
      end

      def menu_item(&block)
        MenuItem.new(&block)
      end

      def items
        self.instance.items
      end
    end
  end

  class MenuItem
    attr_accessor :title, :route

    def initialize(&block)
      instance_eval &block
    end

    def title(&block)
      self.title = block.call
    end

    def route(&block)
      self.route = block.call
      Menu.instance.items << self
    end
  end
end
