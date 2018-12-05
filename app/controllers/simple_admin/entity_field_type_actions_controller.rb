module SimpleAdmin
  class EntityFieldTypeActionsController < BaseController
    def create
      field_type = params[:entity_field_type_name].constantize

      render json: field_type.new.run(params[:field_name], params[:model_klass_name])
    end
  end
end
