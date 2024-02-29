class RecipesController < ApplicationController
    before_action :set_recipe, only: [ :update, :destroy, :show]
    before_action :set_recipe2, only: [ :ingredients_index, :ingredients_and_amounts_index, :reviews_index, :categories_index]
    before_action :authenticate_request, only: [:create, :update, :destroy]

    def index
      recipes = Recipe.all 
      if recipes
        render json: recipes, status: :ok
      else
        render json: recipes.errors, status: :unprocessable_entity
      end
      # render json: RecipeBlueprint.render(recipes, view: :normal), status: 200
    end
  
    def show
  
      render json: @recipe, status: 200
    end
  
    def create
      recipe = Recipe.new(recipe_params)
      if recipe.save
        render json: recipe, status: :created
      else
        render json: recipe.errors, status: :unprocessable_entity
      end
    end
  
    def update
        
      if @recipe.update(recipe_params)
        render json: @recipe, status: :ok
      else
        render json: @recipe.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @recipe.destroy
        render json: nil, status: :ok
      else
        render json: @recipe.errors, status: :unprocessable_entity
      end
    end
    def ingredients_index
      recipe_ingredients = @recipe2.ingredients
      render json: recipe_ingredients, status: :ok
     
    end

    def ingredients_and_amounts_index
      recipe_ingredient_and_amounts = @recipe2.recipe_ingredients
      render json: recipe_ingredient_and_amounts, status: :ok
    end

    def reviews_index
      recipe_reviews = @recipe2.reviews
      render json: recipe_reviews, status: :ok
    end

    def categories_index
      recipe_categories = @recipe2.categories
      render json: recipe_categories, status: :ok
    end
  
    private
  
    def recipe_params
      params.permit(:name, :description, :servings, :img_url, :instructions, :difficulty_level, :cooking_time, :meal)
    end
    
  
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_recipe2
      @recipe2 = Recipe.find(params[:recipe_id])
    end

  end
