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

  root :to => "customers/items#top"
  get "items/about" => "customers/items#about"

  resources :addresses
  resources :cart_items
  resources :genres
  resources :order_items


  namespace :admins do
    resources :items
    resources :orders
    resources :customers
  end

  namespace :customers do
    resources :items
    resources :orders
    resources :customers
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
