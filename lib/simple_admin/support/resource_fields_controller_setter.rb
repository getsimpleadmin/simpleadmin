module SimpleAdmin
  module ResourceFieldsControllerSetter
    extend ActiveSupport::Concern

    included do
      before_action :set_entity_fields!

      CONTROLLER_ACTION = {
        'index' => 'index',
        'new'   => 'form',
        'edit'  => 'form'
      }

      private

      def set_entity_fields!
        return if SimpleAdmin.core_controllers.include?(self.class)

        @resource_fields = SimpleAdmin::Entity.find_by(
          model_plural_name: controller_entity_name
        ).entity_fields.where(display: field_display)
      end

      def field_display
        CONTROLLER_ACTION[params[:action]]
      end
    end
  end
end
