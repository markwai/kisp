Rails.application.routes.draw do

  root 'pages#home'

  get '/home', to: 'pages#home'

  resources :events, only: [:index, :new, :create, :show, :edit, :update]
  resources :concepts, only: [:index, :new, :create, :show, :edit, :update]
  resources :opinions, only: [:index, :new, :create, :show, :edit, :update]

  resources :users, only: [:create]
  get 'users/register', to: 'users#new'

  resources :articles, only: [:index, :new, :create, :show, :edit, :update] do
    #resources :briefs, only: [:new, :create, :edit, :update]
    resources :comments, only: [:create]
  end

  resources :briefs, only: [:new, :create, :edit, :update] do
    member do
      post :vote
    end
  end

  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/results', to: 'searches#index'
  resources :searches, only: [:create]

end
