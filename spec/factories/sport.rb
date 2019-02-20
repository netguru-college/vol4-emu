FactoryBot.define do
  factory :sport do
    name {Faker::Football.competition}
    icon {Faker::Avatar.image}
  end
end