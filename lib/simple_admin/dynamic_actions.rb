module SimpleAdmin
  class DynamicActions
    MODEL_NAMESPACE = :SimpleAdmin

    def self.set!(klass_name, collection_name)
      model_klass_name = collection_name.to_s.singularize.camelize
      model_klass = "#{MODEL_NAMESPACE}::#{model_klass_name}".constantize

      klass_name.class_eval do
        define_method :index do
          @resources = model_klass.all
          @model_instance = model_klass.new

          render 'admin/collection/index'
        end

        define_method :show do
          @resource = model_klass.find(params[:id])

          render 'admin/collection/show'
        end

        define_method :new do
          @resource = model_klass.new

          render 'admin/collection/new'
        end

        define_method :create do
          @resource = model_klass.new(resource_params)

          if @resource.save
            redirect_to "admin_#{collection_name}_path"
          else
            render :new
          end
        end

        define_method :edit do
          @resource = model_klass.find(params[:id])

          render 'admin/collection/edit'
        end

        define_method :update do
          @resource = model_klass.find(params[:id])

          if @resource.update(resource_params)
            redirect_to "admin_#{collection_name}_path"
          else
            render :edit
          end
        end

        define_method :destroy do
          @resource = model_klass.find(params[:id])
          @resource.destroy
        end

        define_method :resource_params do
          
        end
      end
    end
  end
end
