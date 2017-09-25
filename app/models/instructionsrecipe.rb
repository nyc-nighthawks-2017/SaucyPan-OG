class InstructionsRecipe < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :instruction

  validates :recipe, :instruction, presence: true
end
