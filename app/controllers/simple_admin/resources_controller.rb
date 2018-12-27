module SimpleAdmin
  class ResourcesController < BaseController
    def index
      resource_service = ResourcesService.new(params[:model_klass_name], params[:model_fields])
                                         .index_action(params[:per_page], params[:page], params[:sort], params[:query], params[:model_attributes])

      render json: {
        resources: resource_service.resources,
        total: resource_service.total
      }
    end

    def show
      model_fields = params[:model_fields].map { |model_field| model_field['field_name'] }

      resource = model_klass.find(params[:id]).attributes.slice(*model_fields)

      render json: resource
    end

    def create
      resource = model_klass.new(resource_params)

      if resource.save
        render json: resource
      else
        render json: resource.errors
      end
    end

    def update
      resource = model_klass.find(params[:id])

      if resource.update(resource_params)
        render json: resource
      else
        render json: resource.errors
      end
    end

    def destroy
      resource = model_klass.find(params[:id])

      resource.destroy
    end

    private

      def model_klass
        params[:model_klass_name].constantize
      end

      def resource_params
        params.require(:resource).permit!
      end
  end
end
