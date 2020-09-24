Rails.application.routes.draw do
  resources :comments
  resources :tickets
  resources :users
  resources :categories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#index'
  resources :categories do
    resources :products
  end
  resources :products
end
