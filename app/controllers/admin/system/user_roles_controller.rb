# frozen_string_literal: true

class Admin::System::UserRolesController < Admin::ApplicationController
  authorize_resource class: SimpleAdmin::UserRole

  include SimpleCrudify::Crudify

  actions :crud

  def model_klass
    @project.user_roles
  end

  private

  def controller_notice(action_name)
    t("simple_admin.resource.#{action_name}.success", resource_name: model_klass.model_name.element.capitalize)
  end

  def after_create_path
    edit_admin_system_user_role_path(@project, @resource)
  end

  def after_destroy_path
    admin_system_user_roles_path
  end

  def resource_params
    params.require(:simple_admin_user_role).permit(:name)
  end
end
