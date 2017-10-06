module SimpleAdmin
  module ResourceController
    class ActionsBuilder
      # Build CRUD actions for controller
      #
      # @since 0.1.1

      def self.initialize_actions!(controller_klass, model_name)
        controller_klass.class_eval do
          include ResourceController::DynamicFields
          include ResourceController::Crudify

          include Helpers::UrlHelper

          def after_create_path
            resource_link(model_klass.new, :index)
          end

          def after_update_path
            resource_link(model_klass.new, :index)
          end

          def after_destroy_path
            resource_link(model_klass.new, :index)
          end

          define_method :model_klass do
            model_name.constantize
          end

          private

            def template_path(controller_action=nil)
              "simple_admin/admin/resource/#{controller_action || params[:action]}"
            end
        end
      end
    end
  end
end
