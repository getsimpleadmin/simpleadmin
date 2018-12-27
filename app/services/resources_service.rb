class ResourcesService
  attr_reader :model_klass, :model_fields

  def initialize(model_klass_name, model_fields)
    @model_klass  = model_klass_name.constantize
    @model_fields = model_fields.map { |field_attributes| field_attributes[:field_name] }
  end

  def index_action(per_page, page, sort, query, model_attributes)
    per_page = per_page.to_i
    page     = page.to_i if page.present?

    total = model_klass.count

    resources = model_klass.limit(per_page)

    if query.present?
      search_result = search(query, model_klass, model_attributes)

      resources = search_result[:resources]
      total     = search_result[:total]
    end

    resources = resources.offset((per_page * page) - per_page) if page.present?

    resources = if sort.present?
      resources.order(sort[:column_name] => sort[:order])
                else
      resources.order(id: :asc)
                end

    resources = resources.map do |resource|
      _resource = {}

      resource.attributes.each do |attribute_name, attribute_value|
        next unless model_fields.include?(attribute_name)

        _resource[attribute_name] = attribute_value
      end

      _resource
    end

    OpenStruct.new(
      resources: resources,
      total: total
    )
  end

  private

    def search(search_query, model_klass, model_attributes)
      return [] if model_attributes.empty?

      query = model_attributes.map { |model_attribute| "#{model_attribute} LIKE ?" }.join(' OR ')
      query_arguments = model_attributes.map { "%#{search_query}%" }

      {
        resources: model_klass.where(query, *query_arguments),
        total: model_klass.where(query, *query_arguments).count
      }
    end
end
