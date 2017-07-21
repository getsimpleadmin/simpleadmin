FactoryGirl.define do
  factory :setting, class: SimpleAdmin::Setting do
    name { Faker::Name.title }
    value { :en }

    label { 'Default language' }
  end
end
