Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end
  # get 'homes/index'
  
  root to: 'homes#index'  
  resources :purchase, only: [:index]
  # root 'users#index'  
  
  get 'mypage/index'
  # resources :mypage
  root "mypage#index"
  get 'mypage/logout'
  root "mypage#logout"
end

