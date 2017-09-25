class Recipe < ActiveRecord::Base
  belongs_to :submitter, class_name: "User"
  has_many :ingredients_recipes
  has_many :ingredients, through: :ingredients_recipes
  has_many :ratings
  has_many :raters, through: :ratings, source: :rater

  validates :name, :category, :difficulty_level, :prep_time, :creator, presence: true
end
