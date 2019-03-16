module SimpleAdmin
  module V1
    class ResourcesController < SimpleAdmin::V1::BaseController
      def index
        per_page = params[:per_page].to_i
        page     = params[:page].to_i if params[:page].present?

        total = model_klass.count

        resources = model_klass.limit(per_page)

        if params[:query].present?
          search_result = SimpleAdmin::Abstractions::Model.search(params[:query], model_klass, params[:model_attributes])

          resources = search_result.resources
          total     = search_result.total
        end

        resources = resources.offset((per_page * page) - per_page) if page.present?

        resources =
          if params[:sort].present?
            resources.order(params[:sort][:column_name] => params[:sort][:order])
          else
            resources.order(id: :asc)
          end

        render json: {
          resources: resources.pluck(*params[:model_fields]).map { |resource| params[:model_fields].zip(resource).to_h },
          total: total
        }
      end

      def show
        resource = model_klass.find(params[:id])

        render json: resource.attributes.slice(*params[:model_fields])
      end

      def create
        resource = model_klass.new(resource_params)

        if resource.save
          render json: resource
        else
          render json: resource.errors
        end
      end

      def update
        resource = model_klass.find(params[:id])

        if resource.update(resource_params)
          render json: resource
        else
          render json: resource.errors
        end
      end

      def destroy
        resource = model_klass.find(params[:id])

        resource.destroy
      end

      private

        def model_klass
          SimpleAdmin::Abstractions::Model.find_by_name(params[:model_klass_name])
        end

        def resource_params
          params.require(:resource).permit!
        end
    end
  end
end
