Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    get 'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get "users/index",to: "users#index"
    get "users/card", to: "users#card"
    get "users/logout", to: "users#logout"
  end

  root to: 'products#index'
  resources :products do
    resources :purchase, only: [:index] do
      collection do        
        # post "card", to: "purchase#card"
        get "done", to: "purchase#done"
      end
    end
  end

  resources :cards, only: [:new, :create] do
  end
  # resources :purchase, only: [:index]
  # root 'users#index'
end


