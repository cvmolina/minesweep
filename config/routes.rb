Rails.application.routes.draw do
  concern :playable do
    member do
      post :step_on
      post :flag
      post :add_question
      put  :freeze
      put  :restore
    end
  end

  namespace :api do
    namespace :v1 do
      resources :guess, concerns: [:playable], only: [:create]

      resources :users, only: [:create, :index] do
        member do
          resources :games, concerns: [:playable],
            only: [:create, :index, :show] do
          end
        end
      end
    end
  end
end
