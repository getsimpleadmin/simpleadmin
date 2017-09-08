module SimpleAdmin
  class ResourceControllerActions
    def self.initialize_actions!(controller_klass, model_name, collection_name)
      controller_klass.class_eval do
        include ResourceFields
        include ResourceCrud

        include ResourceUrlHelper

        def after_create_path
          resource_link(model_klass.new, :index)
        end

        def after_update_path
          resource_link(model_klass.new, :index)
        end

        def after_destroy_path
          resource_link(model_klass.new, :index)
        end

        define_method :model_klass do
          model_name.constantize
        end
      end
    end
  end
end
