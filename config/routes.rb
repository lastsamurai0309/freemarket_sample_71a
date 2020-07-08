Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get "users/index",to: "users#index"
    get "users/card", to: 'users#card'
    get 'users/logout', to: "users#logout"
  end
  # get 'homes/index'
  # root to: 'homes#index'  
  root to: 'products#index'
  resources :products do
  end
  # resources :purchase, only: [:index]
  get 'purchase/index'
  root to: 'purchase#index'  
  get "/purchase", to: 'purchase#done'
  root to: 'purchase#done'  
end

