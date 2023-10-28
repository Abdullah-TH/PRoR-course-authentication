Rails.application.routes.draw do
  resources :login, only: [:new, :create]
  resources :registration, only: [:new, :create]
end
