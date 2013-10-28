Gumtree::Application.routes.draw do
  
  root "application#index"
  
  resources :posters

end
