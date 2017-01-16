require 'sidekiq/web'

Rails.application.routes.draw do
  get '/auth/auth0/callback' => 'auth0#callback'
  get '/auth/failure' => 'auth0#failure'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  mount Sidekiq::Web, at: '/sidekiq'

  resources :websites do
    get :refresh, on: :member
  end
end
