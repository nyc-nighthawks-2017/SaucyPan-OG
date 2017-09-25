class IngredientsController < ApplicationController

  def index
    recipe = Recipe.find_by(id: params[:recipe_id])
    ingredients = recipe.ingredients
    render json: ingredients
  end

  def show
    ingredient = Ingredient.find_by(id: params[:ingredient_id])
    render json: ingredient
  end

  def create
    ingredient = Ingredient.new(ingredient_params)
    ingredient.save
    recipe = Recipe.find_by(id: params[:id])
    ingredients_recipe = IngredientsRecipe.new(recipe: recipe, ingredient: ingredient)
    ingredients_recipe.save
    render json: ingredient
  end

  def delete
    ingredient = Ingredient.find_by(id: params[:ingredient_id])
    ingredient.destroy
  end

  def update
    ingredient = Ingredient.find_by(id: params[:ingredient_id])
    ingredient.update(ingredient_params)
    ingredient.save
    render json: ingredient
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
