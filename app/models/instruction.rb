class Instruction < ActiveRecord::Base
  has_many :instructions_recipes
  has_many :recipes, through: :instructions_recipes

  validates :position, :step, presence: true
  validates :position, uniqueness: true
end
