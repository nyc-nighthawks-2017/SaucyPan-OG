class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
    	render json: @recipes
	end 

	def show
		@recipe = Recipe.find_by(id: params[:id])
   	 	@ingredients = @recipe.ingredients.order(:item_id)
    	@user = @recipe.submitter
	end 

	def create
		@recipe = Recipe.new
    	@recipe.name = params[:recipe][:name]
   	 	@recipe.category = params[:recipe][:category]
	    @recipe.difficulty_level = params[:recipe][:difficulty_level]
	    @recipe.directions = params[:recipe][:directions]
	    @recipe.prep_time = params[:recipe][:prep_time]
	    @recipe.creator = params[:recipe][:creator]
	    @recipe.submitter = current_user
	    @recipe.save

	    params[:Ingredients_recipes].each do | ingredient |
      		if (Ingredient.find_by(name: ingredient[:name]))
        		@component = Ingredient.find_by(name: ingredient[:name]))
      		else
         		@component = Ingredient.new
         		@component.name = ingredient[:name]
         		@component.save
      		end

      	ing = Ingredients_recipes.new
      	ing.amount = Ingredients_recipes[:amount]
      	ing.measurement = Ingredients_recipes[:measurement]
      	ing.recipe = @recipe
      	ing.name = @component
      	ing.save
    	end
      
	end

	def update
		recipe = Recipe.find_by(name: params[:name])
    	recipe.update(recipe_params)
    	recipe.save
    	render json: recipe
	end 

	def delete 
		recipe = Recipe.find_by(id: params[:recipe_id])
    	recipe.destroy
	end 

	 private
  	def recipe_params
    	params.require(:recipe).permit(:name)
  	end

end
