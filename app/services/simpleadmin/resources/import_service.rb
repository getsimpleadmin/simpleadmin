# frozen_string_literal: true

class Simpleadmin::Resources::ImportService
  attr_reader :project_connector, :model_klass_name, :spreadsheet, :header_columns

  def initialize(project_connector, model_klass_name, file)
    @project_connector = project_connector
    @model_klass_name = model_klass_name

    @spreadsheet = Roo::Spreadsheet.open(file.path)
    @header_columns = spreadsheet.row(1)

    validate_header!
  end

  def import
    (2..spreadsheet.last_row).each_with_object([]) do |index, result|
      row = Hash[[header_columns, spreadsheet.row(index)].transpose]
      result.push(row)

      project_connector.send_request(:create_resource, row.to_h)
    end
  end

  private

  def validate_header!
    database_columns = project_connector.send_request(:table, {}, model_klass_name)
    database_columns = database_columns.map { |_, name| name }

    header_columns.each do |column|
      raise(ArgumentError, 'Fields do not match database') unless database_columns.include?(column)
    end
  end
end
