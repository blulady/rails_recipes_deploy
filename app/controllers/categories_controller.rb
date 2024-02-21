class CategoriesController < ApplicationController
    before_action :set_category, only: [ :update, :destroy, :show]
  
    def index
      categories = Category.all 
  
      render json: categories, status: 200
    end
  
    def show
  
      render json: @category, status: 200
    end
  
    def create
      category = Category.new(category_params)
      if category.save
        render json: category, status: :created
      else
        render json: category.errors, status: :unprocessable_entity
      end
    end
  
    def update
        
      if @category.update(category_params)
        render json: @category, status: :ok
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @category.destroy
        render json: nil, status: :ok
      else
        render json: @category.errors, status: :unprocessable_entity
      end
    end

    def recipes_index
      category = Category.find(params[:category_id])
      category_recipes = category.recipes
      if category_recipes
        render json: category_recipes, status: :ok
      else
        render json: category_recipes.errors, status: :unprocessable_entity
      end
    end

  
    private
  
    def category_params
      params.permit(:name, :description, :link)
    end
  
    def set_category
      @category = Category.find(params[:id])
    end
  end
