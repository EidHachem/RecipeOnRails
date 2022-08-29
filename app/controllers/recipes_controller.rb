class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def public
    @public_recipes = Recipe.where(public: true)
  end
end
