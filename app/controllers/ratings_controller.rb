class RatingsController < ApplicationController
  def recipe_index
    recipe = Recipe.find_by(id: params[:recipe_id])
    render json: recipe.ratings
  end

  def user_index
    user = User.find_by(id: params[:user_id])
    render json: user.ratings
  end
end
