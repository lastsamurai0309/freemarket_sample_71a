Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  root to: 'products#index'

  resources :products do
  # resources :purchase, only: [:index]
end
  # get "purchase/index"
  # root "purchase#index"
  # get "purchase/done"
  # root "purchase#done"
  # root 'users#index'
