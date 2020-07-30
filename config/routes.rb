Rails.application.routes.draw do
  # devise_for :users
  root to: 'products#index'

  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks'
    # registrations: 'users/registrations'
   }


  # devise_for :users, controllers: {
  #   registrations: 'users/registrations'
  # }
  devise_scope :user do
    # get '/users/sign_out' => 'devise/sessions#destroy'
    # resources :users do
    #   collection do
        get  'addresses', to: 'users/registrations#new_address'
        post 'addresses', to: 'users/registrations#create_address'
        get "users/index",to: "users#index"
        get "users/card", to: "users#card"
        get "users/products",to:"users#products"
        # get "users/logout", to: "users#logout"
    #   end
    # end
  end
  # get '/users/sign_out' => 'devise/sessions#destroy'
  # get "users/index",to: "users#index"
  # get "users/card", to: "users#card"
  # get "users/products",to:"users#products"
    # get "users/logout", to: "users#logout"
  #   get  'addresses', to: 'users/registrations#new_address'
  #   post 'addresses', to: 'users/registrations#create_address'
  # end
  resources :users, only: [:index]

  resources :products do
    resources :purchases, only: [:index] do
      collection do
        get "set_images"    
        # post "card", to: "purchases#card"
        get "done", to: "purchases#done"
      end
    end
  end

  resources :cards, only: [:index, :new, :create, :destroy] do
  end

  get 'products/new/mid_category', to: 'products#mid_category'
  get 'products/new/small_category', to: 'products#small_category'
end


