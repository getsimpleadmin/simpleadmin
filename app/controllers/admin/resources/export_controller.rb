# frozen_string_literal: true

module Admin::Resources
  class ExportController < Admin::ApplicationController
    def index
      @entity = @project.entities.find_by!(model_klass_name: params[:resource_id])
      @entity_fields = @entity.entity_fields.collection

      response = @project_connector.send_request(:resources, resource_params)

      @resources = response.resources

      render xlsx: @entity.model_klass_name.pluralize.downcase, template: 'admin/resources/export.xlsx.axlsx'
    end

    private

    def resource_params
      {
        table_name: @entity.model_klass_name,
        table_fields: @entity_fields.names_with_types,
        per_page: params[:export_total],
        page: params[:page] || 1,
        query: params[:query],
        model_attributes: @entity.entity_fields.search_indexable_columns,
        sort: params[:sort].present? ? sort_params : ''
      }
    end

    def sort_params
      params.require(:sort).permit(:column_name, :order)
    end
  end
end
