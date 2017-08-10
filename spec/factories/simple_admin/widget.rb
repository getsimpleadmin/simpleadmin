FactoryGirl.define do
  factory :widget, class: SimpleAdmin::Widget do
    name { :featured }
  end
end
