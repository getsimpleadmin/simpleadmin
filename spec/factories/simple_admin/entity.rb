FactoryGirl.define do
  factory :entity, class: SimpleAdmin::Entity do
    model_klass_name  { 'Post' }
    model_plural_name { :posts }
  end
end
