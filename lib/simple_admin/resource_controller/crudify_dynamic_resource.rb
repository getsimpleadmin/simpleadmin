module SimpleAdmin
  module ResourceController
    module CrudifyDynamicResource
      extend ActiveSupport::Concern

      included do
        def create
          @resource = model_klass.new(resource_params)
          @resource.save

          respond_to do |format|
            format.js { render layout: false }
          end
        end

        def update
          @resource = model_klass.find(params[:id])
          @resource.update(resource_params)

          respond_to do |format|
            format.js { render layout: false }
          end
        end

        def destroy
          @resource = model_klass.find(params[:id])
          @resource.destroy

          respond_to do |format|
            format.js { render layout: false }
          end
        end
      end
    end
  end
end
