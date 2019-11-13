Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"} #updated to after update path, goes to the user profile page
    mount StripeEvent::Engine, at: '/stripe-webhooks'

  get 'investments/index'
  get 'investments/show'
  get 'investments/new'
  get 'investments/create'
  get 'campaigns/index'
  get 'campaigns/show'
  get 'campaigns/new'
  get 'campaigns/create'

  root to: 'pages#home'

  get "profiles/:id", to: "pages#user_profile", as: :user_profile
  get "certificates/:id/show", to: "certificates#show", as: :see_certificate

  get "/contact", to: "pages#contact", as: :contact_page

  get "/help", to: "pages#help", as: :help_page

  get "/dashboard", to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

resources :certificates, only: [:index, :show]

resources :orders, only: [:show, :create] do
  resources :payments, only: :new
end

  resources :campaigns, only: [:index, :show] do
    resources :investments, only: [:new, :create]
    resources :reviews, only: [:create, :new]
end
  resources :investments, only: [:index, :show]
end

