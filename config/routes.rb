Rails.application.routes.draw do
  devise_for :users
  root "floors#index"
  root to: "residents#index"
  root to: "records#index"
  resources :users, only: [:edit, :update]
  resources :floors, only: [:index, :new, :create, :edit, :update] do
    resources :residents, only: [:index] do
      resources :records, only: [:index, :create]
    end
  end
  resources :residents, only: [:new, :create, :edit, :update]
end