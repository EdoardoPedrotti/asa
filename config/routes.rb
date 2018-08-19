Rails.application.routes.draw do
  resources :adoption_requests
  resources :users
  resources :animals do
    put 'adoptable', to: 'animals#make_adoptable'
    resources :adoption_requests, :except => [:index, :show, :create, :update, :destroy] do
      delete 'remove', to: 'animals#remove_request'
    end
  end
  resources :workers
  resources :shelters do
  	member do
  			get 'adoption_requests', to: 'adoption_requests#get_shelter_requests'
    end
    
    resources :animals, :except => [:destroy,:create, :update,:show] do
      delete 'remove', to: 'shelters#remove_animal'
      # delete '', to: 'shelters#remove_animal'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
 