FoodInventory::Application.routes.draw do
  resources :inventories, only: [:new]
end
