FactoryGirl.define do
  factory :post, class: Post do
    title { Faker::Name.title }
    description { 'example' }

    user_id { double }
  end
end
