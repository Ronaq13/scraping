Rails.application.routes.draw do
  namespace :v1, defaults: { format: 'json' } do
    resources :url, except: [:update]
  end
end
