module Api::V1
  module SimpleAdmin
    class EntitiesController < BaseController
      before_action :load_models

      def index
        render json: {
          entities_names: ApplicationRecord.descendants.map { |model| model.name }
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
end
