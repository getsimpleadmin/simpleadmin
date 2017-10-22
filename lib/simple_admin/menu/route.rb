module SimpleAdmin
  module Menu
    class Route
      attr_accessor :method_name, :resource_name, :params

      def initialize(method_name, *args)
        @method_name = method_name
        @resource_name, @params = *args
      end
    end
  end
end
