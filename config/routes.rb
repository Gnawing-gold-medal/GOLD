Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  root :to => "items#top"
  get "items/about" => "items#about"

  
  resources :items
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
