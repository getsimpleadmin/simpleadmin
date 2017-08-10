FactoryGirl.define do
  factory :widget_type, class: SimpleAdmin::WidgetType do
    name { :featured }
  end
end
