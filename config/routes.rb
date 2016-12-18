Rails.application.routes.draw do
  root to: "home#show"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      patch '/movies/update_watched_status', to: 'movies#update'
      get '/movies/alphabetize_movies', to: 'movies#index'
      resources :movies, only: [:index, :update]
    end
  end

  resources :users, only: [:new, :create]
  resources :movies, only: [:index, :create, :update, :edit, :show, :destroy]
  resources :tags, only: [:index, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
