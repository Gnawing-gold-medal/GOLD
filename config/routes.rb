Rails.application.routes.draw do
  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
    passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
}

  root :to => "items#top"
  get "items/about" => "items#about"

  resources :dmins
  resources :addresses
  resources :cart_items
  resources :genres
  resources :order_items
  

  namespace :admin do
    resources :items
    resources :orders
    resources :customers
  end

  namespace :customer do
    resources :items
    resources :orders
    resources :customers
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
