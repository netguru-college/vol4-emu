FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    created_at {Faker::Date.forward(23)}
    updated_at {Faker::Date.forward(23)}
    username {Faker::Name.name}
    username {Faker::Avatar.image}
    description {Faker::ChuckNorris.fact}
    city {Faker::Address.city}
  end
end