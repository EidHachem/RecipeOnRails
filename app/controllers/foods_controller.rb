class FoodsController < ApplicationController
  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def show
    @food = Food.find(params[:id])
  end
end
