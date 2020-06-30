Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
  end

  # get 'homes/index'
  # root "purchase#index"
  root to: "mypage#index"
  get "mypage" => "card#index"
  # root to: 'homes#index'
  # resources :purchase, only: [:index]

end