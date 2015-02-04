Myflix::Application.routes.draw do
  root 'pages#front'

  get 'ui(/:action)', controller: 'ui'
  get '/home', to: "videos#index"
  get '/register', to: "users#new"
  get '/sign_in', to: "sessions#new"
  post '/sign_in', to: "sessions#create"
  get 'sign_out', to: "sessions#destroy"

  resources :users, only: [:create]
  resources :videos, only: [:show]
  resources :categories, only: [:show]

end
