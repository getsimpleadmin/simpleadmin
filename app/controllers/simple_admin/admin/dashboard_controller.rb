module SimpleAdmin
  module Admin
    class DashboardController < BaseController
      def index
      end

      private

      def enable_entity_fields
        false
      end
    end
  end
end
