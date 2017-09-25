class IngredientsRecipe < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :recipe
  
  validates :amount, :measurement, presence: true
end
