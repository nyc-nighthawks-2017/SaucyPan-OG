class User < ActiveRecord::Base
  has_many :submitted_recipes, class_name: "Recipe", foreign_key: :submitter_id
  has_many :ratings, foreign_key: :rater_id
  has_many :rated_recipes, through: :ratings, source: :recipe

  validates :first_name, :last_name, :username, presence: true
  validates :email, { presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i, message: "Incorrect email format" } }
  validates :password, {  length: {minimum: 3, maximum: 50} }

  has_secure_password
end
