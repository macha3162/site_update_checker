require 'sidekiq/web'
Rails.application.routes.draw do
  mount Sidekiq::Web, at: "/sidekiq"

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
