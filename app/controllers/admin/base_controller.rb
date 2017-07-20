module Admin
  class BaseController < ActionController::Base
    layout 'simple_admin'

    include SimpleAdmin::EntityControllerSetter

    before_action :set_entity_fields!
    before_action :respond_with_locale

    private

    def respond_with_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end

    def set_entity_fields!
      return if self.class == Admin::EntitiesController || self.class == Admin::EntityFieldsController || self.class == Admin::DashboardController

      case params[:action]
      when 'index'
        fields_display = :index
      when 'new'
        fields_display = :form
      when 'edit'
        fields_display = :form
      end

       if SimpleAdmin::Entity.where(name: default_controller_entities[self.class]).any?
        @resource_fields = SimpleAdmin::Entity.find_by(
          name: default_controller_entities[self.class]
        ).entity_fields.where(display: fields_display)
      end
    end

    def default_controller_entities
      {
        Admin::PostsController => SimpleAdmin::Post.to_s,
        Admin::CategoriesController => SimpleAdmin::Category.to_s,
        Admin::EntityFieldTypesController => SimpleAdmin::EntityFieldType.to_s,
        Admin::LanguagesController => SimpleAdmin::Language.to_s
      }
    end
  end
end
