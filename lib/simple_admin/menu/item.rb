module SimpleAdmin
  module Menu
    class Item
      attr_accessor :label, :route, :icon

      def initialize(&block)
        instance_eval &block
        # Storage.instance.items << self
      end

      def label
        self.label = yield
      end

      def route
        self.route = yield
      end

      def icon
        self.icon = yield
      end
      #
      # def route(&block)
      #   if block_given?
      #     self.route = block
      #   else
      #     self.instance_variable_get(:@route)
      #   end
      # end
      #
      # def icon(&block)
      #   if block_given?
      #     self.icon = yield
      #   else
      #     self.instance_variable_get(:@icon)
      #   end
      # end
      #
      # def set_route(__routing_mapper__)
      #   __routing_mapper__.public_send(route.call.method_name,
      #                                  route.call.resource_name,
      #                                  route.call.params)
      # end
      #
      # def method_missing(method_name, *args)
      #   Route.new(method_name, *args)
      # end
    end
  end
end
