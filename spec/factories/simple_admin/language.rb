FactoryGirl.define do
  factory :language, class: SimpleAdmin::Language do
    name { Faker::Name.title }
    code { 'en' }

    status { true }
  end
end
