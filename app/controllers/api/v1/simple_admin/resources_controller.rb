module Api::V1
  module SimpleAdmin
    class ResourcesController < BaseController
      def index
        model_klass  = params[:model_klass_name].constantize
        model_fields = params[:model_fields].map { |field_attributes| field_attributes[:field_name] }

        per_page = params[:per_page].to_i
        page     = params[:page].to_i if params[:page].present?
        total    = model_klass.count

        resources = model_klass.limit(per_page)

        if params[:query].present?
          search_result = search(params[:query], model_klass, params[:model_attributes])

          resources = search_result[:resources]
          total     = search_result[:total]
        end

        resources = resources.offset((per_page * page) - per_page) if page.present?
        resources = resources.order(params[:sort][:column_name] => params[:sort][:order]) if params[:sort].present?

        resources = resources.map do |resource|
          _resource = {}

          resource.attributes.each do |attribute_name, attribute_value|
            next unless model_fields.include?(attribute_name)

            if params[:model_fields].find { |field_attributes| field_attributes[:field_name] == attribute_name && field_attributes[:field_type] == 'image' }.present?
              _resource[attribute_name] = "#{ENV['HOST']}/#{resource.public_send(attribute_name).url}"
            else
              _resource[attribute_name] = attribute_value
            end
          end

          _resource
        end

        render json: {
          resources: resources,
          total:     total
        }
      end

      def show
        model_klass = params[:model_klass_name].constantize
        model_fields = params[:model_fields].split(',')

        resource = model_klass.find(params[:id]).attributes.slice(*model_fields)

        render json: resource
      end

      def create
        model_klass = params[:model_klass_name].constantize

        resource = model_klass.new(resource_params)
        resource.image = CarrierStringIO.new(Base64.decode64(resource_params[:image]))

        if resource.save
          render json: resource
        else
          render json: resource.errors
        end
      end

      def update
        model_klass = params[:model_klass_name].constantize
        resource = model_klass.find(params[:id])

        if resource.update(resource_params)
          render json: resource
        else
          render json: resource.errors
        end
      end

      def destroy
        model_klass = params[:model_klass_name].constantize
        resource = model_klass.find(params[:id])

        resource.destroy
      end

      private

        def search(search_query, model_klass, model_attributes)
          return [] if model_attributes.empty?

          query = model_attributes.map { |model_attribute| "#{model_attribute} LIKE ?" }.join(' OR ')
          query_arguments = model_attributes.map { "%#{search_query}%" }

          {
            resources: model_klass.where(query, *query_arguments),
            total:     model_klass.where(query, *query_arguments).count
          }
        end

        def resource_params
          params.require(:resource).permit!
        end
    end
  end
end
