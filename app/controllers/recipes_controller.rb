class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def public
    @public_recipes = Recipe.where(public: true)
  end
end
