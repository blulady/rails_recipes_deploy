class ReviewsController < ApplicationController
    before_action :set_review, only: [ :update, :destroy, :show]
  
    def index
      reviews = Review.all 
  
      render json: reviews, status: 200
    end
  
    def show
  
      render json: @review, status: 200
    end
  
    def create
      review = Review.new(review_params)
      if review.save
        render json: review, status: :created
      else
        render json: review.errors, status: :unprocessable_entity
      end
    end
  
    def update
        
      if @review.update(review_params)
        render json: @review, status: :ok
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      if @review.destroy
        render json: nil, status: :ok
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def review_params
      params.permit(:comment, :rating, :date, :recipe_id, :user_id)
    end
  
    def set_review
      @review = Review.find(params[:id])
    end
  end
