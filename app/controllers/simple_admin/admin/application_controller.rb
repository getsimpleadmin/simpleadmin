module SimpleAdmin
  module Admin
    class ApplicationController < ActionController::Base
      layout 'simple_admin'

      before_action :authenticate_user!

      def current_user
        # TODO: Add authenticated user here
        raise NotImplementedError
      end

      private

        def authenticate_user!
          # TODO: Add authentication logic here
          raise NotImplementedError
        end

        def current_ability
          SimpleAdmin::Ability.new(current_user)
        end
    end
  end
end
