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
		puts params
		# Parameters: {"recipeName"=>"blah", "category"=>"Appetizer", "difficultyLevel"=>"5", "ingredient"=>"nada", "prepTime"=>"2", "directions"=>"nada", "creator"=>"nada"}
		@recipe = Recipe.new
    	@recipe.name = params[:recipe][:recipeName]
   	 	@recipe.category = params[:recipe][:category]
	    @recipe.difficulty_level = params[:recipe][:difficultyLevel]
	    @recipe.instructions.push(Instruction.create(step: params[:recipe][:directions], position: 1))
			# @recipe.ingredients.push(Ingredient.create(name: params[:recipe][:ingredient]))
	    @recipe.prep_time = params[:recipe][:prepTime]
	    @recipe.creator = params[:recipe][:creator]
	    @recipe.submitter = User.first
	    if @recipe.save
				render json: @recipe
			else
				puts @recipe.errors.full_messages
			end
	end

end
