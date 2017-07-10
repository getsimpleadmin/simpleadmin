module SimpleAdmin
  class DynamicActions
    MODEL_NAMESPACE = "SimpleAdmin"

    def self.set!(klass_name, collection_name)
      model_klass_name = collection_name.to_s.singularize.camelize
      model_klass = "#{MODEL_NAMESPACE}::#{model_klass_name}".constantize

      klass_name.class_eval do
        define_method :index do
          instance_variable_set(:@collection, model_klass.all)

          render 'admin/collection/index'
        end

        define_method :show do
          instance_variable_set(:@resource, model_klass.find(params[:id]))

          render 'admin/collection/show'
        end
      end
    end
  end
end
