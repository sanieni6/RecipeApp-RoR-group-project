class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.where(user_id: current_user.id)
  end

  def create
    @recipe_food = RecipeFood.new(recipe_id: params[:recipe_id], **recipe_food_params)
    if @recipe_food.save
      flash[:notice] = 'Recipe food created successfully'
      redirect_to recipe_path(params[:recipe_id])
    else
      flash[:alert] = 'Recipe food creation failed'
      render :new
    end
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe.user_id = current_user.id
    @recipe_food = RecipeFood.find(params[:id])
    @food = Food.find(@recipe_food.food_id)
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(**update_recipe_food_params)
      redirect_to recipe_path(@recipe_food.recipe_id)
    else
      flash[:alert] = 'Failed to update recipe food'
      render :edit
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    flash[:success] = 'Recipe Food deleted successfully.'
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def update_recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
