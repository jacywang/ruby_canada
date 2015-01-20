PostitTemplate::Application.routes.draw do
  root to: 'topics#index'
  resources :topics, only: [:index, :show, :new, :create, :edit, :update] do 
    resources :comments, only: [:create]
  end

  resources :categories, only: [:new, :create, :show]
end
