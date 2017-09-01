FactoryGirl.define do
  factory :post, class: SimpleAdmin::Post do
    title { Faker::Name.title }
    description { 'example' }
    category_id { 999 }
    user_id { 999 }
  end
end
