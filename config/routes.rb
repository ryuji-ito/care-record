Rails.application.routes.draw do
  devise_for :users
  root "floors#index"
  resources :users, only: [:edit, :update]
  resources :floors, only: [:index, :new, :create, :edit, :update]
  resources :residents, only: [:index, :new, :create, :edit, :update] do
    resources :records, only: [:index, :create]
  end
end
