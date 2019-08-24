# frozen_string_literal: true

class Ability
  include CanCan::Ability

  attr_reader :user, :model_name

  def initialize(user, model_name, project_slug)
    @user = user
    @model_name = model_name

    if user.is_a?(User)
      grant_user_abilities
    elsif project_slug == 'demo'
      grant_demo_abilities
    else
      grant_role_abilities
    end
  end

  private

  def grant_demo_abilities
    can :read, :all
  end

  def grant_user_abilities
    can :manage, :all
  end

  def grant_role_abilities
    user.user_role.user_role_abilities.each do |user_role_ability|
      if system_resource?(user_role_ability.resource_name)
        public_send(:can, user_role_ability.action_name.to_sym, user_role_ability.resource_name.constantize)
      elsif model_name == user_role_ability.resource_name
        public_send(:can, user_role_ability.action_name.to_sym, :resource)
      end
    end
  end

  def system_resource?(resource_name)
    resource_name.include?('SimpleAdmin')
  end
end
