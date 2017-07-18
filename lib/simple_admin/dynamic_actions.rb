module SimpleAdmin
  class DynamicActions
    MODEL_NAMESPACE = :SimpleAdmin

    def self.set!(klass_name, collection_name)
      model_klass_name = collection_name.to_s.singularize.camelize
      model_klass = "#{MODEL_NAMESPACE}::#{model_klass_name}".constantize

      klass_name.class_eval do
        define_method :index do
          @collection = model_klass.all

          render 'admin/collection/index'
        end

        define_method :show do
          @resource = model_klass.find(params[:id])

          render 'admin/collection/show'
        end

        define_method :new do
        end

        define_method :create do
        end

        define_method :edit do
          @resource = model_klass.find(params[:id])

          render 'admin/collection/edit'
        end

        define_method :update do
        end

        define_method :destroy do
          @resource = model_klass.find(params[:id])
          @resource.destroy
        end
      end
    end
  end
end
