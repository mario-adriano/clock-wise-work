Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      post '/authenticate', to: 'authentication#login'
      
      resources :users
      resources :projects

      resources :projects, only: [] do
        member do
          get 'times', to: 'time_logs#show'
        end
      end

      resources :time_logs, only: [:update, :create]
      
      get '/*a', to: 'application#not_found'
    end
  end
end
