PostitTemplate::Application.routes.draw do
  root to: 'topics#index'

  get "/register", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :topics, only: [:index, :show, :new, :create, :edit, :update] do 
    resources :comments, only: [:create]
  end

  resources :categories, only: [:new, :create, :show]

  resources :users, only: [:create, :show, :edit, :update]
end
