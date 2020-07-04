Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  # get 'homes/index'
  # root "purchase#index"
  root to: "mypage#index"
  get "mypage/card", to: 'mypage#card'
  # root to: 'homes#index'
  # root to: 'products#index'

  # resources :products do
  # end
  # resources :purchase, only: [:index]

end