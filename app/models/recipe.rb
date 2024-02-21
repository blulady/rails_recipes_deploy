class Recipe < ApplicationRecord
    validates :name, :instructions, :cooking_time, presence: true

    has_and_belongs_to_many :users
    has_and_belongs_to_many :categories
    has_many :recipe_ingredients
    has_many :ingredients, through: :recipe_ingredients
    has_many :reviews
end
