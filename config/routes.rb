Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: "users/registrations"} #updated to after update path, goes to the user profile page
  root to: 'pages#home'

  get "profiles/:id", to: "pages#user_profile", as: :user_profile

  get "/contact", to: "pages#contact", as: :contact_page

  get "/help", to: "pages#help", as: :help_page

  get "/dashboard", to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :campaigns, only: [:index, :show] do
    resources :investments, only: [:new, :create]
end
  resources :investments, only: [:index, :show]
end
