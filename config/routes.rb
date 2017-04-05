Rails.application.routes.draw do
  devise_for :users
  resources :users
  
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'
  root 'static_pages#index'
  post 'static_pages/thank_you'
  post 'static_pages/index'
  
  resources :orders, only: [:index, :show, :create, :destroy]

  resources :products do
    resources :comments
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
