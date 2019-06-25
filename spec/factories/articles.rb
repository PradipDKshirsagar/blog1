FactoryBot.define do
  factory :article do
    title     { Faker::Lorem.sentence(3) }
    text      { Faker::Lorem.sentence(3) }
  end
end