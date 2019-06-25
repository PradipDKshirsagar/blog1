FactoryBot.define do
  factory :comment do
    article
    commenter     { Faker::Name.name }
    body          { Faker::Lorem.sentence(3) }
  end
end