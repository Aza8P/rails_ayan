Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope '(:locale)', locale: /en|mn/ do
    devise_for :users
    root to: 'pages#home'
    get 'about', to: 'pages#about', as: 'about'
    get 'contact', to: 'pages#contact', as: 'contact'
    # get 'agenda', to: 'pages#agenda', as: 'agenda'
    resources :travel_preferences, only: %i[create edit update new]

    # Sidekiq Web UI, only for admins.
    require "sidekiq/web"
    authenticate :user, ->(user) { user.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end
  end
end
