# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resources :csv, only: %i[index create]
  resources :politicos, only: %i[index show]
end
