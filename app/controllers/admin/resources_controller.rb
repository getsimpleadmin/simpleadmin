# frozen_string_literal: true

class Admin::ResourcesController < Admin::ApplicationController
  authorize_resource class: false

  PER_PAGE = 20
  TEMPLATE_PATH = 'admin/resources'

  before_action :collection_fields_unexist!, only: :index, unless: proc { fields_exists?(:collection) }
  before_action :form_fields_unexist!, only: %i[edit new], unless: proc { fields_exists?(:form) }
  before_action :show_fields_unexist!, only: :show, unless: proc { fields_exists?(:show) }

  def index
    @entity = @project.entities.find_by!(model_klass_name: params[:resource_id])
    @entity_fields = @entity.entity_fields.collection.latest

    if @entity_fields.present?
      response = @project_connector.send_request(:resources,
                                                 resource_params.merge(table_fields: @entity_fields.names_with_types))

      @resources = Kaminari.paginate_array(response.resources, total_count: response.total).page(params[:page])
                           .per(params[:per_page] || PER_PAGE)
    end

    render template_path(:index)
  end

  def show
    @entity = @project.entities.find_by!(model_klass_name: params[:resource_id])
    @entity_fields = @entity.entity_fields.show.latest

    @resource = ::SimpleAdmin::Resource.new(@entity_fields.pluck(:name))
    if @entity_fields.present?
      @resource.mass_assign_params(@project_connector
                .send_request(:resource, resource_params
                .merge(table_fields: @entity_fields.names_with_types), params[:id]))
    end

    render template_path(:show)
  end

  def new
    @entity = @project.entities.find_by!(model_klass_name: params[:resource_id])
    @entity_fields = @entity.entity_fields.form.latest

    @resource = ::SimpleAdmin::Resource.new(@entity_fields.pluck(:name))

    render template_path(:new)
  end

  def edit
    @entity = @project.entities.find_by!(model_klass_name: params[:resource_id])
    @entity_fields = @entity.entity_fields.form.latest

    @resource = ::SimpleAdmin::Resource.new(@entity_fields.pluck(:name))
    if @entity_fields.present?
      @resource.mass_assign_params(@project_connector.send_request(:resource,
                                                                   resource_params, params[:id]))
    end

    render template_path(:edit)
  end

  def update
    @entity = @project.entities.find_by!(model_klass_name: params[:resource_id])
    @entity_fields = @entity.entity_fields.form

    @resource = ::SimpleAdmin::Resource.new(@entity_fields.pluck(:name))
    @resource.mass_assign_params(@project_connector.send_request(:resource, resource_params, params[:id]))

    response = @project_connector.send_request(:update_resource, resource_permited_params.to_h, params[:id])

    if response.code == '200'
      redirect_to admin_resources_path, notice: t('simple_admin.resource.update.success', resource_name: resource_name)
    else
      redirect_to edit_admin_resource_path(@project), notice: JSON.parse(response.body).first
    end
  end

  def create
    @entity = @project.entities.find_by!(model_klass_name: params[:resource_id])
    @entity_fields = @entity.entity_fields.form

    @resource = ::SimpleAdmin::Resource.new(@entity_fields.pluck(:name))
    @resource.mass_assign_params(resource_permited_params.to_h)

    response = @project_connector.send_request(:create_resource, resource_permited_params.to_h)

    if response.code == '200'
      redirect_to admin_resources_path, notice: t('simple_admin.resource.create.success', resource_name: resource_name)
    else
      redirect_to new_admin_resource_path(@project), notice: JSON.parse(response.body).first
    end
  end

  def destroy
    @project_connector.send_request(:destroy_resource, {}, params[:id])

    redirect_to admin_resources_path, notice: t('simple_admin.resource.destroy.success', resource_name: resource_name)
  end

  private

  def collection_fields_unexist!
    redirect_to edit_admin_system_model_path(@project, entity), notice: t('admin.warnings.collection_fields')
  end

  def show_fields_unexist!
    redirect_to edit_admin_system_model_path(@project, entity), notice: t('admin.warnings.show_fields')
  end

  def form_fields_unexist!
    redirect_to edit_admin_system_model_path(@project, entity), notice: t('admin.warnings.form_fields')
  end

  def fields_exists?(presentation)
    entity = @project.entities.find_by!(model_klass_name: params[:resource_id])
    entity.entity_fields.where(presentation: presentation).any?
  end

  def resource_name
    params[:resource_id].capitalize.singularize
  end

  def template_path(template_name)
    "#{TEMPLATE_PATH}/#{template_name}"
  end

  def resource_permited_params
    params.require(:simple_admin_resource).permit(*@entity_fields.form.pluck(:name))
  end

  def resource_params
    {
      table_name: @entity.model_klass_name,
      table_fields: @entity_fields.pluck(:name),
      per_page: PER_PAGE,
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
