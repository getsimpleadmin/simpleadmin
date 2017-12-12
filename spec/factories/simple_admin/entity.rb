FactoryBot.define do
  factory :entity, class: SimpleAdmin::Entity do
    model_klass_name  { 'Post' }
  end
end
