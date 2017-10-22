FactoryBot.define do
  factory :profile, class: SimpleAdmin::Profile do
    first_name { 'John' }
    last_name  { 'Doe' }

    twitter_nickname { '@johndoe' }
  end
end
