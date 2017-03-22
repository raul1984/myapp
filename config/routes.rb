Rails.application.routes.draw do
  get 'orders/index'

  get 'static_pages/landing_page'

  resources :object_names
  resources :products
  get 'static_pages/contact'

  root 'static_pages/about'

  get 'static_pages/index'

  get 'static_pages#landing_page'
  
  resources :orders, only: [:index, :show, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
