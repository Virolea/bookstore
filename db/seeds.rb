# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all

20.times do
  User.create!(email: Faker::Internet.free_email,
               password: "azertyuiop",
               username: Faker::Internet.user_name)
end

200.times do
  Book.create!(title: Faker::Book.title,
               author: Faker::Book.author,
               user: User.find(rand(1..20)))
end
