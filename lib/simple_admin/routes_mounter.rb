module SimpleAdmin
  module RoutesMounter
    extend self

    def mount_system_routes!(routing_mapper)
      menu_system_routes.each do |route|
        routing_mapper.public_send(route.method_name,
                                   route.resource_name,
                                   route.params || {})
      end
    end

    private

      def menu_system_routes
        Config.menu_items.map(&:route)
      end
  end
end
