class RecipesController < ApplicationController
  def index
    @recipes = Recipe.includes([:user], [:recipes_foods]).where(user_id: current_user.id).order(created_at: :desc)
    @recipes.each do |recipe|
      recipe.recipes_foods.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
    end
  end

  def public
    @public_recipes = Recipe.includes([:user], [:recipes_foods]).where(public: true).order(created_at: :desc)
    @public_recipes.each do |recipe|
      recipe.recipes_foods.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
    end
  end

  def new
    @user = current_user
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.includes([:user]).find(params[:id])
    @recipe_food = @recipe.recipes_foods.all.includes([:food]).sort_by { |recipe_food| recipe_food.food.name }
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html do
        redirect_to user_recipes_path(user_id: @recipe.user.id), notice: 'Recipe was successfully deleted.'
      end
    end
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to user_recipes_path
    else
      render 'show'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
