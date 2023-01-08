FactoryBot.define do
  factory :dish do
    chef { nil }
    name { Faker::Food.dish }
    description { Faker::Food.description }
  end
end
