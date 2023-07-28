Rails.application.routes.draw do
  # Root route
  root "users#index"

  # Users routes
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  # Posts routes
  resources :posts do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end

  # Custom route example (if needed)
  # get "user_posts_path", to: "posts#index"

  # Additional routes can be defined here...

end
