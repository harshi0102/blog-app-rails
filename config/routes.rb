Rails.application.routes.draw do
  # Devise authentication routes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # Root route
  root "users#index"

  # Regular application views
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create]
  end

  # API endpoints
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index, :show] do
        member do
          get 'posts', to: 'users#posts'
          get 'comments', to: 'users#comments'
          post 'add_comment', to: 'users#add_comment'
        end
      end

      resources :posts, only: [] do
        resources :comments, only: [:index, :create] # Nested comments under posts for API
      end
    end
  end
end
