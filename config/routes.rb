Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :forecast, only: :show
      
      scope module: 'users' do
        resources :users, only: :create
        resources :sessions, only: :create
      end

      resource :gifs, only: :show
    end
  end
end
