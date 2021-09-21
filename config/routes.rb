Rails.application.routes.draw do

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

  namespace :admins do
    resources :customers,only: [:index,:show,:edit,:update]
  	resources :items,only: [:index,:new,:create,:show,:edit,:update,]
  	resources :genres,only: [:index,:create,:edit,:update, :show]
  	resources :orders,only: [:index,:show,:update]
    
  end



  namespace :customers do
    resources :items,only: [:index,:show]
    resources :cart_items do
      collection do
        delete :cart_destroy
      end
    end

  	resource :customers,only: [:show] do
  		member do
        get :leave_page
        patch :leave
      end

      resources :cart_items,only: [:index,:update,:create,:destroy] do
        collection do
          delete :cart_destroy
        end
      end

      resources :orders,only: [:new,:index,:show,:create] do
        collection do
          post :log
          get :thanks
        end
      end

      resources :addresses,only: [:index,:create,:edit,:update,:destroy]
    end
  end
end
