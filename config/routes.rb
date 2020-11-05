Rails.application.routes.draw do

    # Allow signup for users
    resources :users, only: [:new, :create, :edit, :update]

    # Allow login/logout for users
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#logout'

    # Allow access to home page
    get 'home', to: 'home#index'

    get 'memberlist', to: 'memberlist#index'
    post 'memberlist', to: 'memberlist#update'
    get 'event_points', to: 'memberlist#event_points'
    put 'update_event_points', to: 'memberlist#update_event_points'
    
    get 'edit', to: 'users#edit'
    get 'change_password', to: 'users#change_password'
    put 'update_password', to: 'users#update_password'
    
    # Defines the start page of the application
    root 'home#index'

    get "/:page", to: "static#show"
end
