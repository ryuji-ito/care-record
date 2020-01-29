Rails.application.routes.draw do
  devise_for :users
  root "floors#index"
  resources :users, only: [:edit, :update]
  resources :floors, only: [:index, :new, :create, :edit, :update]
  resources :residents, only: [:new, :create, :edit, :update]


end
