class Ingredient < ActiveRecord::Base
  has_many :ingredients_recipes
  has_many :recipes, through: :ingredients_recipes
  
  validates :name, presence: true
end
