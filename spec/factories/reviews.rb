FactoryBot.define do
  factory :review do
    comment { "MyString" }
    rating { 1 }
    date { "2024-02-20 12:49:20" }
    recipe { nil }
    user { nil }
  end
end
