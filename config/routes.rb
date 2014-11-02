Rails.application.routes.draw do
  root 'static#home'
  resources :options do
    resources :items
  end
end
