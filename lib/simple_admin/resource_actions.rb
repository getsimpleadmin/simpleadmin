module SimpleAdmin
  class ResourceActions
    def self.initialize_controller_actions!(controller_klass, model_name, collection_name)
      controller_klass.class_eval do
        before_action :initialize_index_resources, only: :index

        define_method :initialize_index_resources do
          @model_instance  = model_klass.new
          @collection_name = collection_name
        end

        define_method :model_klass do
          model_name.constantize
        end

        define_method :collection_name do
          collection_name
        end

        private

        def redirect_path
          public_send("admin_#{collection_name}_path", current_locale)
        end

        def template_path
          "admin/collection/#{params[:action]}"
        end

        def resource_name
          model_klass.model_name.singular
        end

        def resource_attributes
          SimpleAdmin::Entity.form_attributes(model_klass)
        end
      end
    end
  end
end
