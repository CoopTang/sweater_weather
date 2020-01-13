Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :forecast, only: :show
      resource :antipode, only: :show
    end
  end
end
