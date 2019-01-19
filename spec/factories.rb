FactoryBot.define do
  factory :post do
    title       { Faker::Lorem.characters }
    description { Faker::Lorem.sentence }
  end
end
