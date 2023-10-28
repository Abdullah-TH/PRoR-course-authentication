Rails.application.routes.draw do
  resources :registration, only: [:new, :create]
end
