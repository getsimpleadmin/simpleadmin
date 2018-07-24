module Api::V1
  module SimpleAdmin
    class CredentialsController < BaseController
      def verify_key
        render json: {
          secret_key_valid: secret_key_valid?
        }
      end

      private

        def secret_key_valid?
          ENV['SIMPLE_ADMIN_SECRET_KEY'] == params[:secret_key]
        end
    end
  end
end
