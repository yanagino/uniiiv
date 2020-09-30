Rails.application.routes.draw do
  get "/" => "homes#top"
  get "/search" => "homes#search"

  get '/auth/:provider/callback' => 'sessions#create'
  get "/status" => "sessions#status"
  post "/logout" => "sessions#destroy"
  post "/juniors/:uid" => "sessions#juniors"
  post "/seniors/:uid" => "sessions#seniors"

  resources :users, only: [:update]
  get "/juniors/:uid" => "users#juniors"
  get "/seniors/:uid" => "users#seniors"
  get "/action" => "users#index"

  resources :links, only: [:create] do
    member do
      post :approve
      post :deny
    end
  end

  resources :messages, only: [:index, :show] do
    member do
      post :create
    end
  end

  resources :reviews, only: [:create, :edit, :update, :destroy] do
    member do
      get :new
    end
  end

end
