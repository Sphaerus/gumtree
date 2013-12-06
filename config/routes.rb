Gumtree::Application.routes.draw do
  
  devise_for :users
  root "application#index"
  
  namespace :admin do
    resources :countries do
      resources :provinces, except: :index do
        resources :towns, except: :index
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
