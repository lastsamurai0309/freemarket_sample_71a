Rails.application.routes.draw do

  # get 'homes/index'
  root "purchase#index"
  # root "homes#index"
  # resources :purchase, only: [:index]
  # root 'users#index'
end

