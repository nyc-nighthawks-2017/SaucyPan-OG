class Recipe < ActiveRecord::Base
  belongs_to :submitter, class_name: "User"
  has_many :ingredientsrecipes
  has_many :ingredients, through: :ingredientsrecipes
  has_many :ratings
  has_many :raters, through: :ratings, source: :rater

  validates :name, :category, :difficulty_level, :prep_time, :directions, :creator, presence: true
end
