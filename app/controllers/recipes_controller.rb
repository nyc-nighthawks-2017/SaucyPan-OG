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
    	@recipe.name = params[:recipeName]
   	 	@recipe.category = params[:category]
	    @recipe.difficulty_level = params[:difficultyLevel]
	    @recipe.instructions.push(Instruction.create(step: params[:directions], position: 1))
			# @recipe.ingredients.push(Ingredient.create(name: params[:ingredient]))
	    @recipe.prep_time = params[:prepTime]
	    @recipe.creator = params[:creator]
	    @recipe.submitter = User.first
	    if @recipe.save
				render json: @recipe.instructions
			else
				puts @recipe.errors.full_messages
			end
	end

end
