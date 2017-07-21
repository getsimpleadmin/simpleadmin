FactoryGirl.define do
  factory :entity_field_type, class: SimpleAdmin::EntityFieldType do
    name { Faker::Name.title }
    template { 'fields/string' }
  end
end
