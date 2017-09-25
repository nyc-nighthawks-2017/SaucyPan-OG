class InstructionsController < ApplicationController
  def index
    recipe = Recipe.find_by(id: params[:id])
    instructions = recipe.instructions
    render json: instructions
  end
end
