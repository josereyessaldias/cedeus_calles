Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 	resources :persons, only: [:index, :new, :create, :show, :destroy]
 	resources :clusters, only: [:index, :new, :create, :destroy]
 	resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
 	resources :person_products, only: [:destroy]
 	resources :respaldos, only: [:destroy]

	root 'persons#index'  
end
