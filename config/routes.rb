Rails.application.routes.draw do
  devise_for :customers

  resources :customers do
    resources :shipments
  end  
   
  resources :delivery_partners do
    resources :shipments, only: [:index, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #get 'test' => 'home#test'
  root "home#index"
end
