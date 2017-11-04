module SimpleAdmin
  module Admin
    class EntityFieldsController < BaseController
      def create
        @entity_field = SimpleAdmin::EntityField.new(entity_field_params)
        @entity_field.save

        respond_to do |format|
          format.js { render layout: false }
        end
      end

      def update
        @entity_field = SimpleAdmin::EntityField.find(params[:id])
        @entity_field.update(entity_field_params)

        # TODO Dirty trick for demo
        update_setting_field(@entity_field)

        respond_to do |format|
          format.js { render layout: false }
        end
      end

      def destroy
        @entity_field = SimpleAdmin::EntityField.find(params[:id])
        @entity_field.destroy

        respond_to do |format|
          format.js { render layout: false }
        end
      end


      private

      def update_setting_field(entity_field)
        setting = entity_field.entity_field_setting

        setting_name = params.dig(:simple_admin_entity_field, :field_setting, :name).keys.first
        setting_value = params.dig(:simple_admin_entity_field, :field_setting, :name).values.first

        setting.data.find do |field_setting|
          field_setting.value = setting_value if field_setting.name == setting_name
        end

        setting.save
      end

      def enable_entity_fields
        false
      end

      def entity_field_params
        params.require(:simple_admin_entity_field).permit(:name, :entity_field_type_id, :entity_id, :display)
      end
    end
  end
end
