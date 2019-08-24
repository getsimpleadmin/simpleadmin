# frozen_string_literal: true

class Admin::System::EntityFieldsController < Admin::ApplicationController
  authorize_resource class: SimpleAdmin::EntityField

  include SimpleCrudify::CrudifyDynamicResource

  def update
    super
  end

  def model_klass
    @project.entities.friendly.find_by_friendly_id(params[:entity_id]).entity_fields
  end

  private

  def resource_params
    params.require(:simple_admin_entity_field).permit(:name, :label, :entity_field_type_id, :entity_id, :presentation,
                                                      :sort_order, :model_klass_name, :sorting, :page_section_id,
                                                      :search_indexable, entity_field_type_attributes: [
                                                        :id, entity_field_setting_attributes: [:value]
                                                      ])
  end
end
