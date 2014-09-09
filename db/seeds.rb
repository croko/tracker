# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

puts "creating users...\n"

10.times do |x|
  User.create(
      name: Faker::Name.name,
      email: "user#{x}@gmail.com",
      password: "123123123"
  )
end

10.times do
  task = Task.create(
          name: Faker::Lorem.words(3).join(' ').titleize,
          description: Faker::Lorem.words(50).join(' '),
          user_id: User.pluck(:id).sample
      )
  10.times do
    task.comments.create(
                     user_id: User.pluck(:id).sample,
                     body: Faker::Lorem.words(10).join(' ')
        )
  end
end