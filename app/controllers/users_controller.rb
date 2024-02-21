class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy] #:posts_index1
  
    def index
      users = User.all 
  
      render json: users, status: 200
    end
  
    def show
  
      render json: @user, status: 200
    end
  
    def create
      user = User.new(user_params)
      if user.save
        render json: user, status: :created
      else
        render json: user.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @user.destroy
        render json: nil, status: :ok
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
  
    def recipes_index
      user = User.find(params[:user_id])
      user_recipes = user.recipes
  
      render json: user_recipes, status: :ok
    end
    private
  
    def user_params
      params.permit(:email, :first_name, :last_name, :password_digest)
    end
    
    def set_user
        @user = User.find(params[:id])
      end
end