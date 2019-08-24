# frozen_string_literal: true

class Simpleadmin::DBStructureImport
  COLUMNS_MATCHER_FILE_PATH = 'config/db_columns_matcher.json'
  EXCLUDED_COLUMNS = %w[
    created_at updated_at
  ].freeze

  def initialize(project, model_names, models)
    @project = project

    @model_names = model_names
    @models = models
  end

  def call
    import_models!
    import_fields!
  end

  def import_models!
    model_names.keys.each do |model_name|
      next unless model_enabled?(model_name)

      project.entities.create(model_klass_name: model_name)
    end
  end

  def import_fields!
    models.model_names.each do |model_name|
      next unless model_names.key?(model_name)

      entity = project.entities.find_by(model_klass_name: model_name)
      columns = models.model_columns[model_name]

      columns.each do |column|
        entity_field_type = SimpleAdmin::EntityFieldType.find_by(name: column_matcher[column['data_type']])

        next if entity_field_type.blank?
        next if column['column_name'].include?('_id') || EXCLUDED_COLUMNS.include?(column['column_name'])

        entity_field = entity.entity_fields.new(name: column['column_name'], entity_field_type_id: entity_field_type.id)

        if column['column_name'] != 'id'
          entity_field.presentation = :form
          entity_field.save
        end

        entity_field = entity_field.dup
        entity_field.presentation = :collection

        entity_field.save
      end
    end
  end

  private

  attr_reader :project, :model_names, :models

  def model_enabled?(model_name)
    model_names[model_name] == 'on'
  end

  def column_matcher
    @column_matcher ||= JSON.parse(File.read(COLUMNS_MATCHER_FILE_PATH))
  end
end
