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

          @collection_name = collection_name

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
            redirect_to public_send("admin_#{collection_name}_path", locale: I18n.locale)
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
            redirect_to public_send("admin_#{collection_name}_path", locale: I18n.locale)
          else
            render :edit
          end
        end

        define_method :destroy do
          @resource = model_klass.find(params[:id])
          @resource.destroy

          redirect_to public_send("admin_#{collection_name}_path", locale: I18n.locale)
        end

        define_method :resource_params do
          params_name = model_klass.to_s.underscore.gsub('/', '_')
          attributes = SimpleAdmin::Entity.find_by(name: model_klass.to_s).entity_fields.form.pluck(:name)

          params.require(params_name).permit(attributes)
        end
      end
    end
  end
end
