FactoryGirl.define do
  factory :menu_route, class: SimpleAdmin::Menu::Route do
    method_name   { :resources }
    resource_name { :settings }

    params do
      {
        only: %i[index update]
      }
    end

    initialize_with { new(method_name, resource_name, params) }
  end
end
