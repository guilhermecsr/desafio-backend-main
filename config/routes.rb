Rails.application.routes.draw do
  root 'home#index'

  resources :csv, only: [:index, :create]
  resources :politicos, only: [:index, :show]
end
