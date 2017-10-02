module SimpleAdmin
  class Ability
    include CanCan::Ability

    attr_reader :current_user

    def initialize(current_user)
      @current_user = current_user

      grant_permissions!
    end

    private

      def grant_permissions!
        current_user.permissions.each do |permission|
          public_send permission.action,
                      permission.action_modificator.to_sym,
                      permission.model_klass
        end
      end
  end
end
