Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  scope '(:locale)', locale: /en|mn/ do
    devise_for :users
    root to: 'pages#home'
    resources :trains, only: [:create, :new]
    resources :flights, only: [:create, :new]
    resources :hotels, only: [:create, :new]
    get 'about', to: 'pages#about', as: 'about'
    get 'contact', to: 'pages#contact', as: 'contact'
    # get 'agenda', to: 'pages#agenda', as: 'agenda'
   
  end
end
