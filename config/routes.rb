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
    resources :purchases, only: [:index] do
      collection do        
        # post "card", to: "purchases#card"
        get "done", to: "purchases#done"
      end
    end
  end
  get 'products/new/mid_category', to: 'products#mid_category'
  get 'products/new/small_category', to: 'products#small_category'
end


