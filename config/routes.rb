Gumtree::Application.routes.draw do
  
  devise_for :users
  root "application#index"
  
  resources :categories
    
  resources :posters

end
