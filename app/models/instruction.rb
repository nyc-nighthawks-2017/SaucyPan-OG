class Instruction < ActiveRecord::Base
  has_many :instructionsrecipes
  has_many :recipes, through: :instructionsrecipes

  validates :position, :step, presence: true
  validates :position, uniqueness: true
end
