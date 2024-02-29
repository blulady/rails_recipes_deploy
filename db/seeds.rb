# debugger
(1..10).each do |i|
    recipe = Recipe.create(
        name: Faker::Food.dish,
        description: Faker::Food.description,
        servings: Faker::Food.measurement_sizes,
        img_url: Faker::LoremFlickr.image,
        instructions: Faker::Food.description,
        difficulty_level: Faker::Lorem.word,
        cooking_time: Faker::Food.measurement_sizes,
        meal: Faker::Lorem.word,
    )

end
