FactoryGirl.define do
  factory :entity, class: SimpleAdmin::Entity do
    name { 'SimpleAdmin::Post' }
  end
end
