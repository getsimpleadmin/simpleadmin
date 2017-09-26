module SimpleAdmin
  module ResourceController
    class ControllerBuilder
      # Build controller class by resource name
      # @example ArticlesController
      #  controller_builder = SimpleAdmin::ResourceController::ControllerBuilder.new(:articles)
      #  controller_builder.build!
      #
      #  => controller_builder.controller_klass
      #  => SimpleAdmin::Admin::ArticlesController
      #
      # @since 0.2.0

      attr_reader :controller_name

      def initialize(resource_name)
        @controller_name = "#{resource_name.camelize}Controller"
      end

      def build!
        unless SimpleAdmin::Admin.const_defined?(controller_name)
          Admin.const_set(controller_name, Class.new(SimpleAdmin::Admin::BaseController))
        end
      end

      def controller_klass
        Admin.const_get(controller_name)
      end
    end
  end
end
