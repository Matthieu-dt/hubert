Rails.application.routes.draw do
  # get 'contact/new'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :artworks
  end
  # resources :contacts, only: [:new, :create]
end
