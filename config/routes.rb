RailsDepot::Application.routes.draw do
  resources :line_items
  resources :carts
  resources :products
  
  root :to => 'store#index', :as => 'store'
end
