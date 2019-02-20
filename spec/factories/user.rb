FactoryBot.define do
  factory :user do
    email {Faker::Internet.email}
    password {Faker::Internet.password}
    username {Faker::Name.name}
    avatar {Faker::Avatar.image}
    description {Faker::ChuckNorris.fact}
    city {Faker::Address.city}
  end
end