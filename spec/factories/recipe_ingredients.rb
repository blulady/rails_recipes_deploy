FactoryBot.define do
  factory :recipe_ingredient do
    recipe { nil }
    ingredient { nil }
    measurment { nil }
    ingredient_amount { "9.99" }
  end
end
