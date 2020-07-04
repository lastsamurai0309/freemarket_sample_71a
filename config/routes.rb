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
  
  root to: 'homes#index'  

  get 'mypage/index'
  # resources :mypage
  root to: "mypage#index"
  get "mypage/card", to: 'mypage#card'
  get 'mypage/logout'
  root "mypage#logout"
  root to: 'products#index'

  resources :products do
  end
  # resources :purchase, only: [:index]
  # root 'users#index'
end

