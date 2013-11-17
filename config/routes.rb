Gumtree::Application.routes.draw do
  
  devise_for :users
  root "application#index"
  
  resources :categories do
    resources :fields
  end
  resources :collections do
    patch "add_to_collection" 
    delete "remove_from_collection"
  end
    
  resources :posters

end
