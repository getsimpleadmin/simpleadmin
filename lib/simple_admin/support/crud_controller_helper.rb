module SimpleAdmin
  module CrudControllerHelper
    extend ActiveSupport::Concern

    included do
      def index
        @resources = model_klass.all
      end

      def new
        @resource = model_klass.new
      end

      def edit
        @resource = model_klass.find(params[:id])
      end

      def update
        @resource = model_klass.find(params[:id])

        if @resource.update(resource_params)
          redirect_to redirect_path
        else
          render :edit
        end
      end

      def create
        @resource = model_klass.new(resource_params)

        if @resource.save
          redirect_to redirect_path
        else
          render :new
        end
      end

      def destroy
        @resource = model_klass.find(params[:id])
        @resource.destroy

        redirect_to redirect_path
      end
    end
  end
end
