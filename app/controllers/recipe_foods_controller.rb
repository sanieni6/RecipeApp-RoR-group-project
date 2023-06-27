class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end
end
