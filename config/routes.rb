Myflix::Application.routes.draw do
  root 'pages#front'

  get 'ui(/:action)', controller: 'ui'
  get '/home', to: "videos#index"
  get '/register', to: "users#new"
  get '/sign_in', to: "sessions#new"
  post '/sign_in', to: "sessions#create"
  get 'sign_out', to: "sessions#destroy"

<<<<<<< HEAD
  resources :videos, only: [:show] do 
    collection do 
      post :search, to: 'videos#search'
    end
  end
=======
  resources :users, only: [:create]
  resources :videos, only: [:show]
>>>>>>> bac4806e8b07a00d4eabfff6bc6ee134df5ab893
  resources :categories, only: [:show]

end
