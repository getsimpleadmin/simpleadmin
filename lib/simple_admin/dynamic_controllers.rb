module SimpleAdmin
  class DynamicControllers
    BASE_KLASS = Admin::BaseController
    ADMIN_NAMESPACE = Admin

    attr_reader :controller_name

    def initialize(collection_name)
      controller_klass_name = collection_name.to_s.camelize
      @controller_name = "#{controller_klass_name}Controller"
    end

    def set!
      return if ADMIN_NAMESPACE.const_defined?(controller_name)

      ADMIN_NAMESPACE.const_set(controller_name, Class.new(BASE_KLASS))
    end

    def get_klass_name
      ADMIN_NAMESPACE.const_get(controller_name)
    end
  end
end
