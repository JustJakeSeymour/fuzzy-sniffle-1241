Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :dishes, only: [:show, :update]  

  get "/chefs/:chef_id/ingredients", to: "chef_ingredients#index"
  
  resources :chefs, only: [:show]

end
