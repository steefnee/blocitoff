Rails.application.routes.draw do

  get 'users/show'

  get 'welcome/index'

  devise_for :users
  root to: 'users#show'

  resources :items

  resources :users do
    resources :items, only: [:create, :destroy]
  end


  namespace :api, defaults: { format: :json } do

    resources :users do
      resources :items do
      end
    end

    resources :items
  end

 end
