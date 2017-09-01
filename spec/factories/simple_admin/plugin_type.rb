FactoryGirl.define do
  factory :plugin_type, class: SimpleAdmin::PluginType do
    name { :featured }
  end
end
