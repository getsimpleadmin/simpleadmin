Rails.application.routes.draw do
  scope :featured do
    get 'autocomplete' => 'feature_items#autocomplete'

    resources :feature_items, only: %i[new edit]
  end
end
