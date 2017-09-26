Rails.application.routes.draw do
	resources :recipes, only: [:create, :index, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  put '/users/:id', to: 'users#update'

	get '/recipes/:id/instructions' => 'instructions#index'
	post '/recipes/:id/instructions' => 'instructions#create'
	put '/instructions/:id' => 'instructions#update'
	delete '/instructions/:id' => 'instructions#delete'

	get '/recipes/:recipe_id/ingredients' => 'ingredients#index'
	post '/recipes/:recipe_id/ingredients' => 'ingredients#create'
	delete '/recipes/:recipe_id/ingredients/:ingredient_id' => 'ingredients#delete'
	get '/ingredients/:ingredient_id' => 'ingredients#show'
	put '/ingredients/:ingredient_id' => 'ingredients#update'

	get '/recipes/:recipe_id/ratings' => 'ratings#recipe_index'
	post '/recipes/:recipe_id/ratings' => 'rating#create'
 	get '/users/:user_id/ratings' => 'ratings#user_index'
	delete '/ratings/:rating_id' => 'rating#delete'




end
