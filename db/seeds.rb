# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_food = Food.create(name: "Apple", measurement_unit: 1, price: 1.99, quantity: 1, user_id: 1)
second_food = Food.create(name: "Banana", measurement_unit: 1, price: 2.99, quantity: 1, user_id: 1)
third_food = Food.create(name: "Orange", measurement_unit: 1, price: 3.99, quantity: 1, user_id: 1)
fourth_food = Food.create(name: "Pineapple", measurement_unit: 1, price: 4.99, quantity: 1, user_id: 1)
first_recipe = Recipe.create(name: "Apple Pie", prepation_time: 1.5, cooking_time: 1.5, description: "A delicious apple pie", public: true, user_id: 1)
second_recipe = Recipe.create(name: "Banana Bread", prepation_time: 1.5, cooking_time: 1.5, description: "A delicious banana bread", public: true, user_id: 1)
third_recipe = Recipe.create(name: "Orange Juice", prepation_time: 1.5, cooking_time: 1.5, description: "A delicious orange juice", public: true, user_id: 1)
fourth_recipe = Recipe.create(name: "Pineapple Cake", prepation_time: 1.5, cooking_time: 1.5, description: "A delicious pineapple cake", public: true, user_id: 1)
fifh_recipe = Recipe.create(name: "Apple Pie 2", prepation_time: 1.5, cooking_time: 1.5, description: "A delicious apple pie improved", public: true, user_id: 2)
first_recipe_food = RecipeFood.create(quantity: 1, food_id: first_food.id, recipe_id: first_recipe.id)
second_recipe_food = RecipeFood.create(quantity: 1, food_id: second_food.id, recipe_id: second_recipe.id)
third_recipe_food = RecipeFood.create(quantity: 1, food_id: third_food.id, recipe_id: third_recipe.id)
fourth_recipe_food = RecipeFood.create(quantity: 1, food_id: fourth_food.id, recipe_id: fourth_recipe.id)
fith_recipe_food = RecipeFood.create(quantity: 1, food_id: first_food.id, recipe_id: second_recipe.id)