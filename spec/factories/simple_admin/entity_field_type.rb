FactoryBot.define do
  factory :entity_field_type, class: SimpleAdmin::EntityFieldType do
    name { Faker::Name.title }
    template { 'simple_admin/fields/string' }
  end
end
