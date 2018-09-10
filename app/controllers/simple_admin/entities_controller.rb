module SimpleAdmin
  class EntitiesController < BaseController
    before_action :load_models

    def index
      models = []

      ApplicationRecord.descendants.each do |model|
        models << {
          name:    model.name,
          columns: model.columns.map { |column| { name: column.name, type: column.sql_type.parameterize.underscore } }
        }
      end

      render json: {
        models: models
      }
    end

    def show
      resource_klass = params[:id].capitalize.constantize

      render json: {
        name: resource_klass.name,
        column_names: resource_klass.column_names
      }
    end

    private

      def load_models
        Rails.application.eager_load!
      end
  end
end
