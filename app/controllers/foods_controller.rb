class FoodsController < ApplicationController
  def index
    @foods = Food.includes([:user]).where(user_id: current_user.id).order(:name)
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @user = current_user
    @food = current_user.foods.new(user_id: current_user.id, name: params[:name], price: params[:price],
                                   quantity: params[:quantity], measurement_unit: params[:measurement_unit])
    if @food.save
      redirect_to(user_foods_path(user_id: @user.id), notice: 'Food was successfully created.')
    else
      link_to('Back', user_food_path(user_id: @user.id))
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    respond_to do |format|
      format.html do
        redirect_to user_food_path(user_id: @food.user.id), notice: 'Food was successfully deleted.'
      end
    end
  end
end
