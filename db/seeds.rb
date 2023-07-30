# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# db/seeds.rb
# Crear un usuario administrador

#Para ponerme a mi misma admin
User.create!(
    name: 'Sandy',
    email: 'sandra14_lu@hotmail.com',
    password: '123456',
    role: 2
  )

require 'faker'

10.times do
  name = Faker::Name.name
  email = Faker::Internet.email
  password = Faker::Internet.password

  User.create!(
    name: name,
    email: email,
    password: password,
    role: rand(0..2)
  )
end

30.times do
  title = Faker::Lorem.sentence
  description = Faker::Lorem.paragraph
  image_url = Faker::LoremFlickr.image(size:"300x200", search_terms: ['cat'])+"?random=#{Faker::Number.unique.number(digits: 2)}"

  user = User.all.sample

  Post.create!(
    title: title,
    description: description,
    image: image_url,
    user_id: user.id
  )
end

puts 'comentarios'
posts = Post.all
users = User.all
until Comment.count == 100 do
  Comment.create(
    content: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
    post_id: posts.sample.id,
    user_id: users.sample.id
  )
end

puts 'Reacciones'
r_type = %w[post]
kinds = Post::Kinds
until Reaction.count == 100 do
  rel_type = r_type.sample
Reaction.create(post_id: posts.sample.id, user_id: users.sample.id, kind: kinds.sample, reaction_type: rel_type)
end



