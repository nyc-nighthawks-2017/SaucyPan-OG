Rails.application.routes.draw do
	resources :recipes, only: [:create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html















































  # Adams routes
  get '/recipes/:recipe_id/ingredients' => 'ingredients#index'
  post '/recipes/:recipe_id/ingredients' => 'ingredients#create'
  delete '/recipes/:recipe_id/ingredients/:ingredient_id' => 'ingredients#delete'
  get '/ingredients/:ingredient_id' => 'ingredients#show'
  put '/ingredients/:ingredient_id' => 'ingredients#update'


end
