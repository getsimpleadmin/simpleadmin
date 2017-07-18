module Admin
  class EntityFieldTypesController < BaseController
    include SimpleAdmin::InbuiltControllerSettings

    def index
      @entity_field_types = SimpleAdmin::EntityFieldType.all
    end

    def new
      @entity_field_type = SimpleAdmin::EntityFieldType.new
    end

    def create
      @entity_field_type = SimpleAdmin::EntityFieldType.new(entity_field_type_params)

      if @entity_field_type.save
        redirect_to admin_entity_field_types_path
      else
        render :new
      end
    end

    def destroy
      @entity_field_type = SimpleAdmin::EntityFieldType.find(params[:id])
      @entity_field_type.destroy

      redirect_to admin_entity_field_types_path
    end
  end
end
