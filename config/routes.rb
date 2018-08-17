Rails.application.routes.draw do
  resources :animals
  resources :workers
  resources :shelters do
  	resources :animals
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
