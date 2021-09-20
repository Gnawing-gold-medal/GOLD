Rails.application.routes.draw do
  
  devise_for :admins, controllers: {
   sessions:      'admins/sessions',
    passwords:     'admins/passwords',
   registrations: 'admins/registrations'
  }
  
  devise_for :customers, :controllers => {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
   }
  
  root :to => "customers/items#top"
  get "about" => "customers/items#about"
  
  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
  	resources :items,only: [:index,:new,:create,:show,:edit,:update,]
  	get 'top'=>'products#top'
  	resources :genres,only: [:index,:create,:edit,:update, :show]
  	resources :orders,only: [:index,:show,:update] do
  	  member do
        get :current_index
        resource :order_items,only: [:update]
      end
      collection do
        get :today_order_index
      end
    end
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