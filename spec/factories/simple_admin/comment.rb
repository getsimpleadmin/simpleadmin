FactoryGirl.define do
  factory :comment, class: SimpleAdmin::Comment do
    message { Faker::Lorem.sentence }
  end
end
