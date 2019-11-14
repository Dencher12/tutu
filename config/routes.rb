Rails.application.routes.draw do
  resources :trains do
    resources :cars, shallow: true
  end
  resources :railway_stations do
    patch :update_number, on: :member
  end
  resources :routes
  resources :cars
  resources :tickets

  get 'search/show'
  get 'search/results'

  get 'welcome/index'
  root 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
