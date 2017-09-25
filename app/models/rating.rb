class Rating < ActiveRecord::Base
  belongs_to :rater, class_name: "User"
  belongs_to :recipe

  validates :recipe, uniqueness: {scope: :rater, message: "has already been rated by you :)"}
  validates :rating, presence: true, inclusion: {in: (1..5), message: "needs to be between 1 & 5"}
end
