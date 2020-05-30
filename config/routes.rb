Rails.application.routes.draw do
  root "homes#index"

  root 'users#index'
end

