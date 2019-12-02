Rails.application.routes.draw do
  devise_for :users
  resources :tickets

  get 'search/show'
  get 'search/results'

  get 'admin/welcome/index'
  root 'admin/welcome#index'

  resources :trains

  namespace :admin do

    resources :trains do
      resources :cars, shallow: true
    end

    resources :railway_stations do
      patch :update_number, on: :member
    end

    resources :routes
    resources :cars
    resources :tickets
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
