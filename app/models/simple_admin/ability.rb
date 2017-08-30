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
      if current_user.has_role?(:admin)
        grant_admin_rights
      elsif current_user.has_role?(:editor)
        grant_editor_rights
      end
    end

    def grant_admin_rights
      can :manage, :all
    end

    def grant_editor_rights
      can :manage, :all

      cannot :manage, SimpleAdmin::Entity
      cannot :manage, SimpleAdmin::EntityFieldType
    end
  end
end
