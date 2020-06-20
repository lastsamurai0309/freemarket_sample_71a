Rails.application.routes.draw do

  devise_for :users
  # get 'homes/index'
  # root "purchase#index"
  root to: 'homes#index'
  # resources :purchase, only: [:index]
  # root 'users#index'
end

