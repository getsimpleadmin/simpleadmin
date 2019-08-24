# frozen_string_literal: true

class Admin::System::UserRoleAbilitiesController < Admin::ApplicationController
  authorize_resource class: SimpleAdmin::UserRoleAbility

  include SimpleCrudify::CrudifyDynamicResource

  def model_klass
    @project.user_roles.friendly.find_by_friendly_id(params[:user_role_id]).user_role_abilities
  end

  private

  def resource_params
    params.require(:simple_admin_user_role_ability).permit(:action_name, :resource_name, :user_role_id, :sort_order)
  end
end
