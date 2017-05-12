Rails.application.routes.draw do
  devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :users
  get 'user_mailer/contact_form'

  get 'static_pages/thank_you'

  resources :products do
    resources :comments
  end

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'static_pages/index'

  root 'static_pages#landing_page'
  # root :to => "products#index"

  post 'static_pages/thank_you'

  post 'payments/create'

  mount ActionCable.server => '/cable'

  resources :orders, only: [:index, :show, :create, :destroy]

end