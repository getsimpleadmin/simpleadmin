FactoryBot.define do
  factory :menu_route, class: SimpleAdmin::Menu::Route do
    method_name   { :resources }
    resource_name { :users }

    params do
      {
        only: %i[index edit]
      }
    end

    initialize_with { new(method_name, resource_name, params) }
  end
end
