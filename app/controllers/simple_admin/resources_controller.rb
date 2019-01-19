module SimpleAdmin
  class ResourcesController < BaseController
    before_action :load_models!

    def index
      resource_service = ResourceService.new(model_klass, model_fields)

      render json: resource_service.index_action(params[:per_page], params[:page], params[:sort],
                                                 params[:query], params[:model_attributes], params[:reflection_tables], params[:reflection_columns])
    end

    def show
      resource = model_klass.find(params[:id])

      render json: resource.attributes.slice(*model_fields)
    end

    def show_by
      resource = model_klass.find_by(params[:column_name] => params[:column_value])

      render json: resource.attributes.slice(*model_fields)
    end

    def show_total
      render json: model_klass.count
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

      def load_models!
        Rails.application.load_models!
      end

      def model_klass
        model = params[:model_klass_name].safe_constantize

        if ApplicationRecord.descendants.include?(model)
          model
        elsif model.nil?
          raise ArgumentError
        else
          raise SecurityError
        end
      end

      def model_fields
        params[:model_fields].map { |model_field| model_field['field_name'] }
      end

      def resource_params
        params.require(:resource).permit!
      end
  end
end
