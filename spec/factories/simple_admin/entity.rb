FactoryGirl.define do
  factory :entity, class: SimpleAdmin::Entity do
    name { Faker::Name.title }
  end
end
