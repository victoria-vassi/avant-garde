Rails.application.routes.draw do
  get 'investments/index'
  get 'investments/show'
  get 'investments/new'
  get 'investments/create'
  get 'campaigns/index'
  get 'campaigns/show'
  get 'campaigns/new'
  get 'campaigns/create'

  get 'eg001' => 'eg001_embedded_signing#get'
  post 'eg001' => 'eg001_embedded_signing#create'

  devise_for :users
  root to: 'pages#home'

  get "/dashboard", to: 'pages#dashboard', as: :dashboard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :campaigns, only: [:index, :show] do
    resources :investments, only: [:new, :create]
end
  resources :investments, only: [:index, :show]
end
