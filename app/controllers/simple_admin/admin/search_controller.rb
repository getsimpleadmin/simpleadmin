module SimpleAdmin
  module Admin
    class SearchController < SimpleAdmin::Admin::ApplicationController
      PER_PAGE = 10

      before_action :initialize_fields_entities!

      def index
        @resources = SimpleAdmin::Search.new(params[:query], params[:resource_klass].constantize).process
        @resources = @resources.page(params[:page]).per(PER_PAGE) if @resources.present?

        @resource_name = @entity.model_klass.model_name.element.capitalize
      end

      def initialize_fields_entities!
        raise ActiveRecord::RecordNotFound if search_params_blank?

        @entity = SimpleAdmin::Entity.find_by(model_klass_name: params[:resource_klass])
        @entity_fields = @entity.entity_fields.collection
      end

      private

        def search_params_blank?
          params[:resource_klass].blank? || params[:query].blank?
        end
    end
  end
end
