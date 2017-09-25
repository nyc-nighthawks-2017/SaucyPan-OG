class RatingsController < ApplicationController
  def recipe_index
    recipe = Recipe.find_by(id: params[:recipe_id])
    render json: recipe.ratings
  end

  def user_index
    user = User.find_by(id: params[:user_id])
    render json: user.ratings
  end

  def create
    recipe = Recipe.find_by(id: params[:recipe_id])
    rating = Rating.new(recipe: recipe, rating: params[:rating], rater: current_user)
    if rating.save
      render json: rating
    else
      render json: rating.errors.full_messages
    end
  end

  def delete
    rating = Rating.find_by(id: params[:rating_id])
    rating.destroy if rating.rater = current_user
  end
end
