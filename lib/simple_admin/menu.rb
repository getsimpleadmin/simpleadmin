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
    attr_accessor :label, :route, :icon

    def initialize(&block)
      instance_eval &block
      after_initialize
    end

    def label(&block)
      if block_given?
        self.label = yield
      else
        self.instance_variable_get(:@label)
      end
    end

    def route(&block)
      if block_given?
        self.route = block
      else
        self.instance_variable_get(:@route)
      end
    end

    def icon(&block)
      if block_given?
        self.icon = yield
      else
        self.instance_variable_get(:@icon)
      end
    end

    def set_route(__routing_mapper__)
      __routing_mapper__.public_send(route.call.method_name,
                                     route.call.resource_name,
                                     route.call.params)
    end

    def method_missing(method_name, *args, &block)
      MenuRoute.new(method_name, *args)
    end

    private

      def after_initialize
        Menu.instance.items << self
      end
  end

  class MenuRoute
    attr_accessor :method_name, :resource_name, :params

    def initialize(method_name, *args)
      @method_name = method_name
      @resource_name, @params = *args
    end
  end
end
