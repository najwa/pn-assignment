Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    get 'coach_directory', to: 'coaches#index'
  end
end
