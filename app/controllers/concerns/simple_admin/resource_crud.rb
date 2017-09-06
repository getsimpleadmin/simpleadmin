module SimpleAdmin
  module ResourceCrud
    # Concern that include all CRUD methods
    # @example PostsController with ResourceCrud concern
    #  class PostsController
    #    include SimpleAdmin::ResourceCrud
    #
    #    def model_klass
    #      SimpleAdmin::Post
    #    end
    #
    #    def after_create_path
    #      admin_posts_path
    #    end
    #
    #    def after_update_path
    #      admin_posts_path
    #    end
    #
    #    def after_destroy_path
    #      admin_posts_path
    #    end
    #
    #    private
    #
    #    def resource_params
    #      params.require(:simple_admin_entity).permit(:model_klass_name, :model_plural_name)
    #    end
    #  end
    #
    # @since 0.2.0

    extend ActiveSupport::Concern

    included do
      PER_PAGE = 9

      def index
        @resources = model_klass.page(params[:page]).per(per_page)
        @resource_singular_name = resource_singular_name

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
          redirect_to after_update_path, notice: t('simple_admin.resource.update.success', model_name: resource_singular_name)
        else
          render template: template_path(:edit)
        end
      end

      def create
        @resource =
          if respond_to?(:action_resource_modificator)
            action_resource_modificator.build(resource_params)
          else
            model_klass.new(resource_params)
          end

        if @resource.save
          redirect_to after_create_path, notice: t('simple_admin.resource.create.success', model_name: resource_singular_name)
        else
          render template: template_path(:new)
        end
      end

      def destroy
        @resource = model_klass.find(params[:id])
        @resource.destroy

        redirect_to after_destroy_path, notice: t('simple_admin.resource.destroy.success', model_name: resource_singular_name)
      end

      private

        def resource_params
          params.require(resource_name).permit(resource_attributes)
        end

        def template_path(controller_action=nil)
          "simple_admin/admin/resource/#{controller_action || params[:action]}"
        end

        def resource_singular_name
          model_klass.model_name.element.capitalize
        end

        def per_page
          PER_PAGE
        end
    end
  end
end
