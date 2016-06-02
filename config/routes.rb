Rails.application.routes.draw do
  devise_for :users


  authenticated :user do
    root to: 'users#show', as: :authenticated_root
  end

  root to: 'pages#home'

  resources :books, only: [:new, :create, :edit, :update]
end
