FactoryGirl.define do
  factory :user, class: SimpleAdmin::User do
    email { 'demo@example.com' }

    after(:create) do |user|
      create(:profile, user: user)
    end
  end
end
