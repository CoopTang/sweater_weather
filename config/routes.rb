Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :forecast, only: :show

      get 'antipode', to: 'antipodes#index'
    end
  end
end
