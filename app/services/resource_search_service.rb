class ResourceSearchService
  attr_reader :search_query, :model_klass, :model_attributes

  def initialize(search_query, model_klass, model_attributes)
    @search_query = search_query

    @model_klass = model_klass
    @model_attributes = model_attributes
  end

  def run
    return [] if model_attributes.empty?

    query = model_attributes.map { |model_attribute| "#{model_attribute} LIKE ?" }.join(' OR ')
    query_arguments = model_attributes.map { "%#{search_query}%" }

    OpenStruct.new(
      resources: model_klass.where(query, *query_arguments),
      total: model_klass.where(query, *query_arguments).count
    )
  end
end
