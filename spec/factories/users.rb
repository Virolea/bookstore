FactoryGirl.define do
  factory :user do
    email Faker::Internet.email
    password Faker::Internet.password(8)
    username  Faker::Internet.user_name
  end
end
