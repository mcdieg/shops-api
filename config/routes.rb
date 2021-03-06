Rails.application.routes.draw do
  devise_for :shops
  devise_for :customers
  root to: 'pages#home'
  post '/login', to: 'login#login'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :shops, only: [:index, :show, :new, :create]
      resources :customers, only: [:index, :show, :new, :create]
      resources :orders, only: [:index, :show, :new, :create]
      resources :messages, only: [:index, :create]
      resources :events
      resources :users, only: [ :index, :show, :update ]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
