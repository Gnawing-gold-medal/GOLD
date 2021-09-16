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

  resources :genres
  resources :order_items do
    resources :items
  end


  namespace :admins do
    resources :items
    resources :orders
    resources :customers
  end

  namespace :customers do
    resources :items
    resources :cart_items do
      collection do
        delete :cart_destroy
      end
    end
    resources :customers do
      member do
        get :leave_page
        patch :leave
      end
      resources :addresses
      resources :orders do
        collection do
          post :log
          get :thanks
        end
      end
    end


  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
