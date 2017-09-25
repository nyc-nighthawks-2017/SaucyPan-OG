class Recipe < ActiveRecord::Base
  belongs_to :submitter, class_name: "User"
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  has_many :ratings

  validates :name, :category, :difficulty_level, :prep_time, :directions, :creator, presence: true
end
