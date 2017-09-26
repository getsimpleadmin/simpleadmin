module SimpleAdmin
  class Search
    attr_reader :search_query, :resource_klass, :model_attributes

    def initialize(search_query, resource_klass)
      @search_query = search_query
      @resource_klass = resource_klass

      @model_attributes = SimpleAdmin::EntityField.joins(:entity)
                                                  .where(simple_admin_entities: { model_klass_name: resource_klass.to_s })
                                                  .search_indexable_columns
    end

    def process
      return [] if model_attributes.empty?

      query = model_attributes.map { |model_attribute| "#{model_attribute} LIKE ?" }.join(' OR ')
      query_arguments = model_attributes.map { "%#{search_query}%" }

      resource_klass.where(query, *query_arguments)
    end
  end
end
