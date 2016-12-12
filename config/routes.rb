Rails.application.routes.draw do
  root to: "home#show"

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :movies, only: [:update]
    end
  end

  resources :users, only: [:new, :create]
  resources :movies, only: [:index, :create, :update, :edit, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
