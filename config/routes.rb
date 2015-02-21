Rails.application.routes.draw do

  root 'articles#index'

  resources :users, only: [:create]
  get 'users/register', to: 'users#new'

  resources :articles, only: [:new, :create, :show] do
    resources :briefs, only: [:new, :create, :edit, :update]
    resources :comments, only: [:create]
  end

  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

end