Rails.application.routes.draw do
  root to: 'products#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    
    get '/users/sign_out' => 'devise/sessions#destroy'
    get  'addresses', to: 'users/registrations#new_address'
    post 'addresses', to: 'users/registrations#create_address'
    get "users/index",to: "users#index"
    get "users/card", to: "users#card"
    get "users/logout", to: "users#logout"
  end

  resources :products do
    resources :purchase, only: [:index] do
      collection do
        get "set_images"    
        # post "card", to: "purchase#card"
        get "done", to: "purchase#done"
      end
    end
  end

  resources :cards, only: [:index, :new, :create, :destroy] do
  end

  get 'products/new/mid_category', to: 'products#mid_category'
  get 'products/new/small_category', to: 'products#small_category'
end


