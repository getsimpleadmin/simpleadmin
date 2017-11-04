module SimpleAdmin
  module Admin
    module System
      class EntityFieldTypesController < SystemController
        after_action :make_field_type_template!, only: :create

        def model_klass
          SimpleAdmin::EntityFieldType
        end

        def redirect_path
          admin_system_entity_field_types_path(current_locale)
        end

        private

        def make_field_type_template!
          # self.view_paths[0].to_path
          # copy_file "../../../config/locales/ru.yml", "config/locales/simple_admin.ru.yml"
        end

        def resource_params
          params.require(:simple_admin_entity_field_type).permit(:name, :template)
        end
      end
    end
  end
end
