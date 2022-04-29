Rails.application.routes.draw do
  resources :searches
  resources :explores
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
  get '/:user_id/liked_recipes', to: 'users#liked_posts_of_user'
  post '/like_post/:user_id/:post_id', to: 'likes_counters#like_post'
  post '/unlike_post/:user_id/:post_id', to: 'likes_counters#unlike_post'
  get 'users/:user_id/posts/:post_id', to: 'posts#show'
  get 'users/posts/:post_id', to: "posts#show"
end
