Rails.application.routes.draw do
  root to: "home#show"

  resources :users, only: [:new, :create]
  resources :movies, only: [:index, :create, :update, :edit, :show]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
