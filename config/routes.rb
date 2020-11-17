Rails.application.routes.draw do
  get 'perchases/index'
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
  resources :perchases, only: [:index, :create]
  end
end
