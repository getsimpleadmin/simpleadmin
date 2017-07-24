FactoryGirl.define do
  factory :post, class: SimpleAdmin::Post do
    title { Faker::Name.title }
    description { 'example' }
  end
end
