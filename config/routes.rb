Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html





































 # Instructions
 get '/recipes/:id/instructions' => 'instructions#index'
 post '/recipes/:id/instructions' => 'instructions#create'
 put '/instructions/:id' => 'instructions#update'
 delete '/instructions/:id' => 'instructions#delete'


end
