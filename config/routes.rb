Rails.application.routes.draw do
  get "health/check"
  namespace :api do
    namespace :v1 do
      resources :posts
      resources :categories
    end
  end

  get '/healthcheck', to: 'health#check'
  root "api/v1/posts#index"
end
