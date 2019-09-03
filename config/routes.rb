Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 	resources :persons, only: [:index, :new, :create, :destroy]
 	resources :clusters, only: [:index, :new, :create, :destroy]
 	resources :products, only: [:index, :new, :create, :destroy]

	root 'persons#index'  
end
