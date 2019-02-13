FactoryBot.define do
  factory :user do
    name { Faker::Internet.email }
    email { Faker::Name.name }
  end
end
