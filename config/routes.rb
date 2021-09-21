Rails.application.routes.draw do
  get 'search/search'
  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
    passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }

  # adminのログアウト時にルーティングエラーになったため追加
  devise_scope :admin do
    get '/admins/sign_out' => 'admins/sessions#destroy'
  end

  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
}

  root :to => "customers/items#top"
  get "about" => "customers/items#about"

  resources :infomations do
     collection do
       get :thanks
     end
  end

  resources :order_items do
    resources :items
  end


  namespace :admins do
    resources :genres
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
