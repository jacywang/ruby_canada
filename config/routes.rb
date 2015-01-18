PostitTemplate::Application.routes.draw do
  root to: 'topics#index'
  resources :topics, only: [:index, :show, :new, :create, :edit, :update]
end
