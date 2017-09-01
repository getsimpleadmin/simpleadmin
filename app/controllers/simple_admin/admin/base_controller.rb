module SimpleAdmin
  module Admin
    class BaseController < ActionController::Base
      layout 'simple_admin'

      before_action :authenticate_user!

      def current_ability
        SimpleAdmin::Ability.new(current_user)
      end
    end
  end
end
