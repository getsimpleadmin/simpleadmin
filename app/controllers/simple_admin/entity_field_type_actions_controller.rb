module SimpleAdmin
  class EntityFieldTypeActionsController < BaseController
    def create
      render json: entity_field_type.new.run(params[:field_name], params[:model_klass_name])
    end

    private

      def entity_field_type
        params[:entity_field_type_name].constantize
      end
  end
end
