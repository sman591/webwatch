require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  mount Sidekiq::Web, at: '/sidekiq'

  resources :websites do
    get :refresh, on: :member
  end
end
