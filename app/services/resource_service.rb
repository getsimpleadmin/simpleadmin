class ResourceService
  attr_reader :model_klass, :model_fields

  def initialize(model_klass, model_fields)
    @model_klass  = model_klass
    @model_fields = model_fields
  end

  def index_action(per_page, page, sort, query, model_attributes, reflection_tables, reflection_columns)
    per_page = per_page.to_i
    page     = page.to_i if page.present?

    total = model_klass.count

    resources = model_klass.limit(per_page)

    if reflection_tables.present?
      resources = resources.includes(reflection_tables)
      model_fields.push(*reflection_columns)
    end

    if query.present?
      resource_search_service_instance = ResourceSearchService.new(query, model_klass_name, model_attributes)
      resource_search_service_result   = resource_search_service_instance.run

      resources = resource_search_service_result.resources
      total     = resource_search_service_result.total
    end

    resources = resources.offset((per_page * page) - per_page) if page.present?

    resources = if sort.present?
      resources.order(sort[:column_name] => sort[:order])
                else
      resources.order(id: :asc)
                end

    {
      resources: resources.pluck(*model_fields).map { |resource| model_fields.zip(resource).to_h },
      total: total
    }
  end
end
