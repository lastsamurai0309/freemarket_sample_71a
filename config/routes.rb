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
    resources :purchase, only: [:index, :done] 
      # collection do
      #   get 'done', to: 'purchase#done'
        # post 'pay', to: 'purchase#pay'  
  end
  # resources :purchase, only: [:index]
  
  # get "purchase/index"
  # root "purchase#index"
  # get "purchase/done"
  # root "purchase#done"
  # root 'users#index'
end

