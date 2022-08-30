class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def destroy
    @food = Food.find(params[:id])
    @food.delete
    respond_to do |format|
      format.html do
        redirect_to user_food_path(user_id: @food.user.id), notice: 'Food was successfully deleted.'
      end
    end
  end
end
