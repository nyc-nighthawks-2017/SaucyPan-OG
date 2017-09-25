# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Rating.destroy_all
IngredientsRecipe.destroy_all
InstructionsRecipe.destroy_all

categories = ["Appetizers", "Main Courses", "Desserts", "Sides"]

User.create(username: "username", password: "password", first_name: "first", last_name: "last", email: "email")

10.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, username: Faker::Name.last_name, email: Faker::Internet.safe_email, password: "password")
end

50.times do
  Recipe.create(name: Faker::Name.first_name ,category: categories.sample, difficulty_level: rand(1..5), prep_time: rand(1..120), creator: Faker::Name.name_with_middle, submitter: User.all.sample)
end

100.times do
  Ingredient.create(name: Faker::Lorem.word)
end

100.times do
  Instruction.create(position: rand(1..5), step: Faker::ChuckNorris.fact)
end

20.times do
  InstructionsRecipe.create(recipe: Recipe.all.sample, instruction: Instruction.all.sample)
end

20.times do
  IngredientsRecipe.create(amount: rand(20), measurement: Faker::Lorem.word, recipe: Recipe.all.sample, ingredient: Ingredient.all.sample)
end

3.times do
  Rating.create(recipe: Recipe.all.sample, rater: User.all.sample, rating: rand(1..5))
end
