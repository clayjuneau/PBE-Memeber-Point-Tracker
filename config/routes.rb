Rails.application.routes.draw do
    
    # Allow signup for users
    resources :users, only: [:new, :create]

    # Allow login/logout for users
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#logout'

    # Allow access to home page
    get 'home', to: 'home#index'

    get 'memberlist', to: 'memberlist#index'
    
    # Defines the start page of the application
    root 'home#index'
end
