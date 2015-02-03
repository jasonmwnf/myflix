Myflix::Application.routes.draw do
  root 'users#index'

  get 'ui(/:action)', controller: 'ui'
  get '/home', to: "videos#index"
  get '/register', to: "users#new"
  get '/sign_in', to: "sessions#new"

  resources :videos, only: [:show]
  resources :categories, only: [:show]
end
