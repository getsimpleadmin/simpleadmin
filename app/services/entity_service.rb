class EntityService
  def index_action
    models = []

    ApplicationRecord.descendants.each do |model|
      name = model.name
      columns = model.columns.map do |column|
        {
          name: column.name,
          type: column.sql_type.parameterize.underscore
        }
      end

      models.push(
        name: name,
        columns: columns
      )
    end

    {
      models: models
    }
  end

  def show_action(resource_klass)
    {
      name:         resource_klass.name,
      column_names: resource_klass.column_names,
      columns:      resource_klass.columns.map { |column| { name: column.name, type: column.sql_type.parameterize.underscore } },
      reflections:  resource_klass.reflections.keys
    }
  end
end
