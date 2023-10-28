Rails.application.routes.draw do
  get 'dashboard/index'
  resources :login, only: [:new, :create, :destroy]
  resources :registration, only: [:new, :create]
end
