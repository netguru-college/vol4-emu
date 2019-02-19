FactoryBot.define do

  factory :event do
    sport
    title {'SomeEvent'}
    capacity {22}
    started_at {Faker::Date.forward(22)}
    ended_at {Faker::Date.forward(23) + 22.days}
    description {'sample description'}
  end
end



