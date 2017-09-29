module SimpleAdmin
  module Admin
    class BaseController < ActionController::Base
      layout 'simple_admin'

      before_action :authenticate_user!

      def current_ability
        SimpleAdmin::Ability.new(current_user)
      end

      protected

        def after_sign_in_path_for(resource)
          admin_system_entities_path
        end
    end
  end
end
