Rails.application.routes.draw do
  root "dashboard#index"
  get "dashboard/index"
  resources :login, only: [:new, :create, :destroy]
  resources :registration, only: [:new, :create]
  resources :posts
end
