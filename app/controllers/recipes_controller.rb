class RecipesController < ApplicationController
  load_resource through: :current_user
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(user_id: current_user.id, **recipe_params)
    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else
      flash[:alert] = 'Recipe creation failed'
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    # redirect_to recipes_path
    redirect_to request.referrer
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description, :prepation_time, :cooking_time, :public)
  end

  def public_recipes
    @recipes = Recipe.where(public: true).includes(:user, recipe_foods: :food).order(created_at: :desc)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
