class GeneralshoppinglistController < ApplicationController
  def index
    @all_recipes = Recipe.all
    @recipes = current_user.recipes.includes(:foods)
    @general_foods = current_user.foods

    @missing_foods = @all_recipes.flat_map { |recipe| recipe.missing_foods(@general_foods) }
    @total_count = @missing_foods.length
    @total_price = Recipe.new.total_price(@missing_foods)
  end
end
