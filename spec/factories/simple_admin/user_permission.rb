FactoryBot.define do
  factory :user_permission, class: SimpleAdmin::UserPermission do
    action { :can }
    action_modificator { :manage }
    model_klass_name { :all }
  end
end
