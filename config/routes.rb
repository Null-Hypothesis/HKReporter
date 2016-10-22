Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i(create) do
        collection do
          resource :token, only: %i(create destroy)
        end
      end

      resources :courses, only: %i(index create update delete)

      resources :posts
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
