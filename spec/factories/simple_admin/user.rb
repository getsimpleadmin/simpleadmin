FactoryGirl.define do
  factory :user, class: SimpleAdmin::User do
    email { 'demo@example.com' }
  end
end
