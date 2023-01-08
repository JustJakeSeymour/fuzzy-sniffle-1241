FactoryBot.define do
  factory :ingredient do
    name { Faker::Food.ingredient }
    calorie { Faker::Number.number(digits: 3) }
  end
end
