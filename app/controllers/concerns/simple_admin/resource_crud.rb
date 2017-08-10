module SimpleAdmin
  module ResourceCrud
    extend ActiveSupport::Concern

    included do
      def index
        @resources = model_klass.all

        render template_path
      end

      def new
        @resource = model_klass.new

        render template_path
      end

      def edit
        @resource = model_klass.find(params[:id])

        render template_path
      end

      def update
        @resource = model_klass.find(params[:id])

        if @resource.update(resource_params)
          redirect_to redirect_path, notice: t('.success')
        else
          render :edit
        end
      end

      def create
        @resource = model_klass.new(resource_params)

        if @resource.save
          redirect_to redirect_path, notice: t('.success')
        else
          render :new
        end
      end

      def destroy
        @resource = model_klass.find(params[:id])
        @resource.destroy

        redirect_to redirect_path, notice: t('.success')
      end

      private

      def resource_params
        params.require(resource_name).permit(resource_attributes)
      end

      def template_path
        "#{params[:controller]}/#{params[:action]}"
      end
    end
  end
end
