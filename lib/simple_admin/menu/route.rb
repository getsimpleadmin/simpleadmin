module SimpleAdmin
  module Menu
    class Route
      attr_accessor :method_name, :resource_name, :params

      def initialize(method_name, *args)
        @method_name = method_name
        @resource_name, @params = *args
      end

      def resource_index_path(prefix=:admin_system, postfix=:path)
        public_send("#{prefix}_#{resource_name}_#{postfix}")
      end
    end
  end
end
