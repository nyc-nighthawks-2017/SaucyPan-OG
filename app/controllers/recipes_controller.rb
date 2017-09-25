class RecipesController < ApplicationController
	def index
		@recipes = Recipe.all
    	render json: @recipes
	end

	def show
		@recipe = Recipe.find_by(id: params[:id])
   	 	@ingredients = @recipe.ingredients.order(:item_id)
    	@user = @recipe.submitter
			render json: @recipe
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
			render json: @recipe
	end

end
