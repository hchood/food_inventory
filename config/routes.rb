FoodInventory::Application.routes.draw do
  resources :inventories, only: [:new, :create]
end
