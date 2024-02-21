class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [ :update, :destroy, :show]
  
    def index
      ingredients = Ingredient.all 
  
      render json: ingredients, status: 200
    end
  
    def show
  
      render json: @ingredient, status: 200
    end
  
    def create
      ingredient = Ingredient.new(ingredient_params)
      if ingredient.save
        render json: ingredient, status: :created
      else
        render json: ingredient.errors, status: :unprocessable_entity
      end
    end
  
    def update
        
      if @ingredient.update(ingredient_params)
        render json: @ingredient, status: :ok
      else
        render json: @ingredient.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @ingredient.destroy
        render json: nil, status: :ok
      else
        render json: @ingredient.errors, status: :unprocessable_entity
      end
    end

    def recipes_index
      ingredient = Ingredient.find(params[:ingredient_id])
      recipes_that_have_ingredient = ingredient.recipes
      render json: recipes_that_have_ingredient, status: :ok
    
    end
    def recipes_without_index
      ingredient = Ingredient.find(params[:ingredient_id])
      recipes_without = Recipe.where.not(id: Recipe.joins(:ingredients).where(ingredients: ingredient))
      render json: recipes_without, status: :ok
      
    end
  
    private
  
    def ingredient_params
      params.permit(:name)
    end
  
    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
  end

