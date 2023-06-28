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

  def update
    @recipe_food = RecipeFood.find_by(recipe_id: params[:recipe_id], food_id: params[:food_id])
    if @recipe_food.update(update_recipe_food_params)
      redirect_to recipe_path(params[:recipe_id])
    else
      flash[:alert] = 'Failed to update recipe food'
      render :edit
    end
  end

  def update_recipe_food_params
    params.require(:recipe_food).permit(:quantity)
  end
end
