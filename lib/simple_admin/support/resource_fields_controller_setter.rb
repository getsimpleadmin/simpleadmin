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

      DEFAULT_MODELS = {
        'Admin::PostsController'      => 'SimpleAdmin::Post',
        'Admin::CategoriesController' => 'SimpleAdmin::Category',
      }

      private

      def set_entity_fields!
        return if SimpleAdmin.core_controllers.include?(self.class)

        @resource_fields = SimpleAdmin::Entity.find_by(
          name: model_name
        ).entity_fields.where(display: field_display)
      end

      def model_name
        model_klass_name = controller_entity_name.split('_')
        model_klass_name = model_klass_name.map(&:camelize).map(&:singularize).join('::')

        DEFAULT_MODELS[self.class.name] || model_klass_name
      end

      def field_display
        CONTROLLER_ACTION[params[:action]]
      end
    end
  end
end
