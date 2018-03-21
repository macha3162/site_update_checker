Rails.application.routes.draw do
  get 'login', to: 'sessions#new', as: :login
  match 'logout', to: 'sessions#destroy', via: [:get, :post], as: :logout

  resources :users
  root 'sites#index'
  resources :sites
  resources :sessions, only: %i[index create]
end
