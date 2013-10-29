Gumtree::Application.routes.draw do
  
  root "application#index"
  
  resources :categories
    
  resources :posters

end
