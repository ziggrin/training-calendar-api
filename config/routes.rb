Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :categories
    end
  end

  # Optional: a health check or a root path
  get "up" => "rails/health#show", as: :rails_health_check
  root "api/v1/posts#index"
end
