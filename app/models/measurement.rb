class Measurement < ApplicationRecord
    validates :unit_measurement, presence: true
    has_many :recipe_ingredients
end
