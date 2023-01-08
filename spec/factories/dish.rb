FactoryBot.define do
  factory :dish do
    chef
    name { Faker::Food.dish }
    description { Faker::Food.description }
  end
end
