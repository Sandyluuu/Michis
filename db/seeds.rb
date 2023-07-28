# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# db/seeds.rb
User.create!(
    email: 'sandra14_lu@hotmail.com',
    password: '123456',
    role: 2
  )

require 'faker'

10.times do
  email = Faker::Internet.email
  password = Faker::Internet.password

  User.create!(
    email: email,
    password: password,
    role: rand(0..2)
  )
end

30.times do
  title = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  image_url = Faker::LoremFlickr.image(size:"300x200", search_terms: ['cat'])

  user = User.all.sample

  Post.create!(
    title: title,
    description: description,
    image: image_url,
    user_id: user.id
  )
end
