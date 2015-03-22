Myflix::Application.routes.draw do
  root 'pages#front'

  get 'ui(/:action)', controller: 'ui'
  get '/home', to: "videos#index"
  get '/register', to: "users#new"
  get '/sign_in', to: "sessions#new"
  post '/sign_in', to: "sessions#create"
  get 'sign_out', to: "sessions#destroy"
  get 'my_queue', to: 'queue_items#index'
  get 'people', to: 'relationships#index'
  
  get 'forgot_password', to: 'forgot_passwords#new'
  get 'forgot_password_confirmation', to: 'forgot_passwords#confirm'
  resources :forgot_passwords, only: [:create]

  resources :password_resets, only: [:show]
  get 'expired_token', to: 'password_resets#expired_token'
  
  resources :videos, only: [:show] do 
    collection do 
      post :search, to: 'videos#search'
    end
    resources :reviews, only: [:create]
  end

  resources :users, only: [:create, :show]
  resources :relationships, only: [:create, :destroy]
  resources :categories, only: [:show]
  resources :queue_items, only: [:create, :destroy]
  post 'update_queue', to: 'queue_items#update_queue'

end
