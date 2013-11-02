Gumtree::Application.routes.draw do
  
  devise_for :users
  root "application#index"
  
  resources :categories do
    resources :fields
  end  
    
  resources :posters

end
