require "sidekiq/web"

Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => "/cable"

  get "/auth/auth0/callback" => "auth0#callback"
  get "/auth/failure" => "auth0#failure"
  get "/auth/auth0/logout" => "auth0#logout"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "welcome#index"

  mount Sidekiq::Web, at: "/sidekiq"

  resources :websites do
    get :refresh, on: :member
  end
end
