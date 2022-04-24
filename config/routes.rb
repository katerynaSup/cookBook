Rails.application.routes.draw do
  resources :likes_counters
  resources :comments
  resources :likes
  resources :posts
  resources :users
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
