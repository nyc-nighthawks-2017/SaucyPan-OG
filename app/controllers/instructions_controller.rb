class InstructionsController < ApplicationController
  def index
    recipe = Recipe.find_by(id: params[:id])
    instructions = recipe.instructions.order('position ASC')
    render json: instructions
  end

  def create
    recipe = Recipe.find_by(id: params[:id])
    instruction = Instruction.new(step: params[:step], position: params[:position])
    instruction.recipes.push(recipe)
    if instruction.save
      render json: instruction.recipes[0]
    else
      render json: instruction.errors.full_messages
    end
  end

  def update
    instruction = Instruction.find_by(id: params[:id])
    if instruction.update(step: params[:step], position: params[:position])
      render json: instruction
    else
      render json: "Instruction failed to update."
    end
  end

  def delete
    instruction = Instruction.find_by(id: params[:id])
    if instruction
      instruction.destroy
      render json: instruction.recipes[0]
    else
      render json: instruction.errors.full_messages
    end
  end

# private
#   def instruction_params
#     params.require(:instruction).permit(:position, :step)
#   end
end
