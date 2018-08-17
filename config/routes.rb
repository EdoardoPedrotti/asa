Rails.application.routes.draw do
  resources :adoption_requests
  resources :users
  resources :animals
  resources :workers
  resources :shelters do
  	member do
  			get 'adoption_requests', to: 'adoption_requests#get_shelter_requests'
  	end
  	resources :animals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
