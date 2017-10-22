FactoryBot.define do
  factory :post, class: Post do
    title { Faker::Name.title }
    description { 'example' }
  end
end
