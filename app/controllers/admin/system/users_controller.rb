# frozen_string_literal: true

class Admin::System::UsersController < Admin::ApplicationController
  authorize_resource class: SimpleAdmin::User

  include SimpleCrudify::CrudifyDynamicResource

  def model_klass
    @project.user_roles.friendly.find_by_friendly_id(params[:user_role_id]).users
  end

  def create
    @resource = model_klass.new(resource_params)
    @resource.project = @project

    @resource.save

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def destroy
    @resource = model_klass.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  private

  def resource_params
    params.require(:simple_admin_user).permit(:email, :user_role_id, :password, :password_confirmation)
  end
end
