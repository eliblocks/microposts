FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { "microposts" }
    username { Faker::Internet.username }
  end

  factory :post do
    content { Faker::Lorem.paragraph }
    user
  end
end
