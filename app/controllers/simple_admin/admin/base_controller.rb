module SimpleAdmin
  module Admin
    class BaseController < ActionController::Base
      layout 'simple_admin'

      before_action :authenticate_user!

      rescue_from ActiveRecord::RecordNotFound, with: :resource_not_found

      def current_ability
        SimpleAdmin::Ability.new(current_user)
      end

      def resource_not_found
        respond_to do |format|
          format.html { render file: "#{Rails.root}/public/404", layout: false, status: :not_found }

          format.xml { head :not_found }
          format.any { head :not_found }
        end
      end
    end
  end
end
