module SimpleAdmin
  module V1
    class BaseController < ActionController::API
      before_action :verify_key_is_valid!, unless: :api_test_mode?

      private

        def verify_key_is_valid!
          return head(:forbidden) if key_is_invalid?
        end

        def key_is_invalid?
          request.headers['SimpleAdmin-Secret-Key'] != ENV['SIMPLE_ADMIN_SECRET_KEY']
        end

        def api_test_mode?
          Simpleadmin::Config.instance.api_test_mode
        end
    end
  end
end
