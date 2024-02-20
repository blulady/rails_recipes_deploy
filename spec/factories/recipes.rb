FactoryBot.define do
  factory :recipe do
    name { "MyString" }
    description { "MyString" }
    servings { "9.99" }
    img_url { "MyString" }
    instructions { "MyText" }
    difficulty_level { "MyString" }
    cooking_time { 1 }
    meal { "MyString" }
  end
end
