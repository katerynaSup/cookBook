Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :posts do
    resources :comments
  end
  resources :likes_counters
  resources :likes
  resources :users
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
