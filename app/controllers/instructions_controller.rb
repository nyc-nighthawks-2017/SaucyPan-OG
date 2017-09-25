class InstructionsController < ApplicationController
  def index
    recipe = Recipe.find_by(id: params[:id])
    instructions = recipe.instructions.order('position ASC')
    render json: instructions
  end

  def create
    recipe = Recipe.find_by(id: params[:id])
    instruction = Instruction.new(position: params[:position], step: params[:step])
    instruction.recipes.push(recipe)
    if instruction.save
      render json: instruction.recipes[0]
    else
      render json: instruction.errors.full_messages
    end
  end

  def delete
    instruction = Instruction.find_by(id: params[:id])
    instruction.destroy
    render json: instruction.recipes[0]
  end
end
