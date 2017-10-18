module SimpleAdmin
  module Menu
    class Item
      attr_accessor :label, :route, :icon

      def initialize(&block)
        instance_eval &block
        after_initialize_actions
      end

      def label
        @label || self.label = yield
      end

      def route
        @route || self.route = yield
      end

      def icon
        @icon || self.icon = yield
      end

      def method_missing(method_name, *args)
        Route.new(method_name, *args)
      end

      private

        def after_initialize_actions
          SimpleAdmin::Config.menu_items << self
        end
    end
  end
end
