Rails.application.routes.draw do
  # resources :cart_items
  # resources :carts
  # resources :users
  get '/shopping_cart', to: 'shopping_cart#get_items_in_cart'
  post '/shopping_cart', to: 'shopping_cart#add_items_to_cart'
  delete '/shopping_cart', to: 'shopping_cart#delete_item_from_cart' 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
