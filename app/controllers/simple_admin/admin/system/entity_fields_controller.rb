module SimpleAdmin
  module Admin
    module System
      class EntityFieldsController < ApplicationController
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

          def entity_field_params
            params.require(:simple_admin_entity_field).permit(:name, :label, :entity_field_type_id, :entity_id, :presentation,
                                                              :search_indexable, entity_field_setting_attributes: [:value])
          end
      end
    end
  end
end
