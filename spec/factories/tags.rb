FactoryBot.define do
  factory :tag do
    name { Faker::Verb.unique.base }
  end
end
