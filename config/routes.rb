Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: %i(create) do
        collection do
          resource :token, only: %i(create destroy)
        end
      end

      resources :courses do
        collection do
          resources :tags,
                    as: 'course_tags',
                    controller: 'course_tags',
                    only: %i(index create destroy)
        end
      end

      resources :teachers

      resources :posts do
        collection do
          resources :tags,
                    as: 'post_tags',
                    controller: 'post_tags',
                    only: %i(index create destroy)
        end
      end
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
