Rails.application.routes.draw do
  root 'static#home'
  resources :options do
    resources :items do
      get :name_search, on: :collection
    end
  end
end
