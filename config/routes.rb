Rails.application.routes.draw do
  get 'osessions/login'

  get 'osessions/home'

  get 'osessions/profile'

  get 'osessions/setting'

  get 'informs/new'

  get 'informs/show'

  get 'owners/index'

  get 'owners/new'

  get 'owners/create'

  get 'toast/index'

  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'
  resources :osessions

  resources :products
  resource :cart
  resources :order_items
  resources :users
  resources :resturants do
  resources :products
  end
  resources :owners
  resources :confirms
  resources :informs

  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'pods'  => 'products#new'
  get    'opods'  => 'products#onew'
  get    'product'    => 'products#index'
  get    'own'  => 'owners#new'
  get    'vown'  => 'owners#index'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'signup'  => 'users#new'
  get    'con'  => 'confirms#new'
  post    'con'  => 'confirms#new'
  post   'confirm'  => 'confirms#index'
  get    'confirm'  => 'confirms#index'
  get    'detail'  => 'confirms#show'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get    'ologin'   => 'osessions#login'
  post    'ologin'   => 'osessions#login_attempt'
  get    'ologout'   => 'osessions#logout'
  get    'home'   => 'osessions#home'
  get    'profile'   => 'osessions#profile'
  get    'setting'   => 'osessions#setting'


  get "rest" => "resturants#index"
  get "rast" => "resturants#new"
  get "ret" => "resturants#edit"
  get "rit" => "resturants#show"
  get "infi" => "informs#new"
  get "aries" => "users#admin"
end
