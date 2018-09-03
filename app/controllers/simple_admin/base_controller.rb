module SimpleAdmin
  class BaseController < ActionController::API
    before_action :verify_key_is_valid!

    private

      def verify_key_is_valid!
        return head(:forbidden) unless request.headers['SimpleAdmin-Secret-Key'] == ENV['SIMPLE_ADMIN_SECRET_KEY']
      end
  end
end
