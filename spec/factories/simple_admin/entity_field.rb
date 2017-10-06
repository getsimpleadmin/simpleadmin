FactoryGirl.define do
  factory :entity_field, class: SimpleAdmin::EntityField do
    name { :id }
    presentation { :collection }
  end
end
