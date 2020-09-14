Rails.application.routes.draw do
  get "/" => "homes#top"

  get '/auth/:provider/callback' => 'sessions#create'
  get "/status" => "sessions#status"
  post "/logout" => "sessions#destroy"
  post "/juniors/:uid" => "sessions#juniors"
  post "/seniors/:uid" => "sessions#seniors"

  get "/juniors" => "users#ju_index"
  get "/seniors" => "users#se_index"
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

end
