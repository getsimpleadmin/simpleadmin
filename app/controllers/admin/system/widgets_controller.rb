# frozen_string_literal: true

class Admin::System::WidgetsController < Admin::ApplicationController
  authorize_resource class: SimpleAdmin::Widget

  before_action :models_exists, only: %i[index new]

  include SimpleCrudify::Crudify

  actions :crud

  def model_klass
    @project.widgets
  end

  private

  def models_exists
    redirect_to new_admin_system_model_path, notice: t('admin.warnings.widget') unless SimpleAdmin::Entity.any?
  end

  def after_create_path
    admin_system_widgets_path
  end

  def after_update_path
    admin_system_widgets_path
  end

  def after_destroy_path
    admin_system_widgets_path
  end

  def controller_notice(action_name)
    t("simple_admin.resource.#{action_name}.success", resource_name: model_klass.model_name.element.capitalize)
  end

  def resource_params
    params.require(:simple_admin_widget).permit(:name, :icon, :sort_order, :width,
                                                :project_id, :widget_category_id, :entity_id, :status)
  end
end
