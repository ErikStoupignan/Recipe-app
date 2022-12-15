class RecipeFoodsController < ApplicationController
  # before_action :authenticate_user!, :set_recipe_food, only: %i[show edit update destroy]

  # def index
  #   @foods = Food.includes([:food])
  # end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.create(recipe_foods_params)

    if @recipe_food.save
      # redirect_to @recipe
      render :new, notice: 'Food created sucessfully.'

    else
      render :new, notice: 'Failed to add food'
    end
  end


  private

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
