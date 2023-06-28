class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(user_id: current_user.id, **food_params)
    if @food.save
      flash[:notice] = 'Food created successfully'
      redirect_to foods_path
    else
      flash[:alert] = 'Food creation failed'
      render :new
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to request.referrer
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
