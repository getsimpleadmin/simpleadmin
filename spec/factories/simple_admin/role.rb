FactoryBot.define do
  factory :role, class: SimpleAdmin::Role do
    name { :admin }
  end
end
