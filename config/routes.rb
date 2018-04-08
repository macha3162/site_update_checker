require 'sidekiq/web'
Rails.application.routes.draw do

  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == ENV['BASIC_AUTH_USER'] && password == ENV['BASIC_AUTH_PASSWORD']
  end
  mount Sidekiq::Web, at: "/_sidekiq"

  get 'login', to: 'sessions#new', as: :login
  match 'logout', to: 'sessions#destroy', via: [:get, :post], as: :logout

  resources :users
  root 'sites#index'
  resources :sites do
    post :check
    collection do
      post :crawl
    end
    resources :diffs, controller: :site_diffs, only: %i[index show]
  end
  resources :sessions, only: %i[index create]
end
