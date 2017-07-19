module Admin
  class BaseController < ActionController::Base
    layout 'simple_admin'

    include SimpleAdmin::EntityControllerSetter

    before_action :set_entity_fields!

    private

    def set_entity_fields!
      return if self.class == Admin::EntitiesController || self.class == Admin::EntityFieldsController

      case params[:action]
      when 'index'
        fields_display = :index
      when 'new'
        fields_display = :form
      when 'edit'
        fields_display = :form
      end

      @resource_fields = SimpleAdmin::Entity.find_by(
        name: default_controller_entities[self.class]
      ).entity_fields.where(display: fields_display)
    end

    def default_controller_entities
      {
        Admin::PostsController => SimpleAdmin::Post.to_s,
        Admin::CategoriesController => SimpleAdmin::Category.to_s,
        Admin::EntityFieldTypesController => SimpleAdmin::EntityFieldType.to_s
      }
    end
  end
end
