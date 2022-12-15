class ShoppingListsController < ApplicationController
  def index
    # @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
    # @total = sum(@recipe_foods)
  end

  def create
    # @food = Food.all
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_foods = @recipe.recipe_foods.includes([:food])
    # @total = sum(@recipe_foods)
  end
end
