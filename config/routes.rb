Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
<<<<<<< HEAD

  resources :products do
    resources :comments
  end

  resources :users
 
=======
  resources :users

  resources :products do
    resources :comments
  end
  
>>>>>>> master
  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'
  get 'static_pages/landing_page'
  post 'static_pages/thank_you'
<<<<<<< HEAD
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  resources :orders, only: [:index, :show, :create, :destroy]
end
=======
  root 'static_pages#index'

  #ActionCable for Real Time updates
  mount ActionCable.server => '/cable'

  resources :orders, only: [:index, :show, :create, :destroy]
  post 'payments/create'
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
>>>>>>> master
