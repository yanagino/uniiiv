Rails.application.routes.draw do
  get "/" => "homes#top"
  
  get "/posts" => "posts#index"
  post "/posts" => "posts#create"
  delete "/posts/:id" => "posts#destroy"

  get '/auth/:provider/callback' => 'sessions#create'
  get "/status" => "sessions#status"
  post "/logout" => "sessions#destroy"
  post "/juniors/:uid" => "sessions#juniors"
  post "/seniors/:uid" => "sessions#seniors"

  get "/juniors" => "users#ju_index"
  get "/seniors" => "users#se_index"
  get "/juniors/:uid" => "users#juniors"
  get "/seniors/:uid" => "users#seniors"

  resources :links, only: [:create] do
    member do
      post :approve
      post :deny
    end
  end

end
