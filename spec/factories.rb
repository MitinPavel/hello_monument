FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end

  factory :collection do
    name { Faker::Lorem.sentence }
    user
  end
end
