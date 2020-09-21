Rails.application.routes.draw do
  get 'home/index'

  # Defines the start page of the application
  root 'home#index'
end
