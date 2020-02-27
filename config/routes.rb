Rails.application.routes.draw do
  get 'pages/ditl'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 	resources :persons, only: [:index, :new, :create, :edit, :update, :show, :destroy]
 	resources :clusters, only: [:index, :new, :create, :destroy]
 	resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
 	resources :person_products, only: [:destroy]
 	resources :cluster_persons, only: [:destroy]
 	resources :respaldos, only: [:destroy]
 	resources :comments, only: [:create, :destroy]
 	resources :creations, only: [:index, :show]

 	get 'pages/ditl', as: 'ditl'
 	get 'pages/ditl_show/:id', to: 'pages#ditl_show', as: 'ditl_show'

	root 'persons#index'  
end
