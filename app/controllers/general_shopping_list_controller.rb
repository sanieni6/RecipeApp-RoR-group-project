class GeneralShoppingListController < ApplicationController
    def index
        @food_amount = 0
    @total_price = 0
    @recipe_foods = []
    @displayedFoods = []
    @recipes = Recipe.where(user_id: current_user.id)
    #@need_foods = RecipeFood.where(recipe_id: params[:recipe_id])
    #foodRecipes = RecipeFood.where(recipe_id: @recipes.ids)
    @recipes.each do |recipe|
      foodRecipes = RecipeFood.where(recipe_id: recipe.id)
      foodRecipes.each do |food|
        #puts food.name
          new_food_id = food.food_id
          new_val = Food.find_by(id: new_food_id).quantity
          quantity_needed = new_val - food.quantity
          puts quantity_needed
          next if quantity_needed >= 0

          need_food.quantity = quantity_needed * -1
          @recipe_foods << need_food
          @displayedFoods << Food.find_by(id: new_food_id)
          puts @displayedFoods.name
      end
    end
    @recipe_foods.each do |f|
      @total_price += f.food.price * f.quantity
    end
end
end
