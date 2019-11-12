Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'

  get "profiles/:id", to: "pages#user_profile", as: :user_profile
  get "certificates/:id/show", to: "certificates#show", as: :see_certificate

  get "/dashboard", to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount StripeEvent::Engine, at: '/stripe-webhooks'

resources :certificates, only: [:index, :show]

resources :orders, only: [:show, :create] do
  resources :payments, only: :new
end

  resources :campaigns, only: [:index, :show] do
    resources :investments, only: [:new, :create]
end
  resources :investments, only: [:index, :show]
end

