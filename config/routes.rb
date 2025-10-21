Rails.application.routes.draw do
  # Health check
  get "health", to: "health#index"

  # Resources
  resources :users
  resources :categories
  resources :tags

  resources :posts do
    member do
      get :tags
    end
    resources :comments, only: [:index, :create]
  end

  resources :comments, only: [:show, :update, :destroy]
  resources :post_tags, only: [:create, :destroy]
end
