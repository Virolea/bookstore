FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johndoe#{n}@example.com"}
    password Faker::Internet.password(8)
    sequence(:username) { |n| "johndoe#{n}"}
  end
end
