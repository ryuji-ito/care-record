Rails.application.routes.draw do
  devise_for :users
  root "records#index"
  resources :users, only: [:edit, :update]
  resources :floors, only: [:new, :create]
  resources :residents, only: [:new, :create]


end
