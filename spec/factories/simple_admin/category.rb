FactoryGirl.define do
  factory :category, class: SimpleAdmin::Category do
    title { Faker::Name.title }
  end
end
