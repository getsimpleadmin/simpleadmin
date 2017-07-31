module SimpleAdmin
  class ResourceController
    def initialize(collection_name)
      @controller_klass_name = collection_name.to_s.camelize
    end

    def initialize_controller_klass!
      Admin.const_set(controller_name, Class.new(SimpleAdmin::Admin::BaseController))
    end

    def controller_klass_name
      Admin.const_get(controller_name)
    end

    private

    def controller_name
      "#{@controller_klass_name}Controller"
    end
  end
end
