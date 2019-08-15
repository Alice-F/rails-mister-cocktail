# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# CREER 5 INSTANCES DE INGREDIENT A PARTIR DE L API

require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_url_serialized = open(url).read
ingredient_url = JSON.parse(ingredient_url_serialized)

ingredient_url["drinks"].map! do |ingredient|
  ingredient["strIngredient1"]
end
# p ingredient_url["drinks"]

# ingredient_url_hash = ingredient_url["drinks"]
# # p ingredient_url_hash
# ingredients = []
# ingredient_url_hash.each do |element|
#   # p element ["strIngredient1"]
#   ingredients << element ["strIngredient1"]
# end

puts 'Creating 5 ingredients...'
5.times do
  ingredient = Ingredient.new(name: ingredient_url["drinks"].sample)
  ingredient.save!
end
puts 'Finished!'
