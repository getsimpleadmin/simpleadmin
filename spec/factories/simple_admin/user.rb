FactoryGirl.define do
  factory :user, class: SimpleAdmin::User do
    email { 'demo@example.com' }
    password { 'example' }

    after(:create) do |user|
      create(:profile, user: user)
    end

    trait(:with_role) do
      transient do
        user_role nil
      end

      after(:create) { |user, evaluator| user.add_role evaluator.user_role }
    end
  end
end
