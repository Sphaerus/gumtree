Gumtree::Application.routes.draw do
  
  devise_for :users
  root "application#index"
  
  namespace :admin do
    resources :countries do
      resources :states do
        resources :towns
      end
    end 
    
    resources :categories do
      resources :fields
    end
      
    resources :collections do
      patch "add_to_collection" 
      delete "remove_from_collection"
    end
  end
    
  resources :posters   
  
  get "search", to: "search#index"

end
