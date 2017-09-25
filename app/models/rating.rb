class Rating < ActiveRecord::Base
  belongs_to :rater, class_name: "User"
  belongs_to :recipe

  validates :rating, uniqueness: {scope: :rater, "You have already rated this recipe :)"}
  validates :rating, presence: true, inclusion: {in: 1-5, "Rating needs to be between 1 & 5"}
end
