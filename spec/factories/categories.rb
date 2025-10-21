FactoryBot.define do
  factory :category do
    name { Faker::Book.unique.genre }
    description { Faker::Lorem.paragraph }
  end
end
