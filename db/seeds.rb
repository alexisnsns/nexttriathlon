# frozen_string_literal: true

require 'faker'
require 'uri'

Faker::Config.locale = :en

puts 'Seeding database...'
Race.destroy_all
puts 'All races destroyed'
User.destroy_all
puts 'All users destroyed'
Comment.destroy_all
puts 'All comments destroyed'

 us_coordinates = JSON.parse(File.read("#{Rails.root}/db/us_coordinates.json")).shuffle!


# 10 regular users
3.times do
  user = User.new(
    username: Faker::Name.first_name,
    email: "#{Faker::Internet.username(specifier: 5..8)}-#{rand(1000)}@yopmail.com",
    password: '123456'
  )
  user.save!
  puts "user #{user.username} added"
end

user_admin = User.new(
  username: 'alex',
  email: 'alex@gmail.com',
  password: 'alex'
)
user_admin.save!
puts "user admin #{user_admin.username} added"

# 20 races
5.times do
  coords = us_coordinates.pop
  race = Race.new(
    title: Faker::Lorem.sentence(word_count: 2),
    description: Faker::Hipster.paragraphs(number: 1).join,
    organizer: Faker::Company.name,
    link: 'www.ironman.com',
    date: Faker::Time.forward(days: 23, period: :morning),
    bike: %w[Flat Rolling Hilly].sample,
    swim: %w[Ocean/Sea Lake].sample,
    run: %w[Flat Rolling Hilly].sample,
    format: %w[M L XL].sample,
    address: Faker::Address.full_address,
    latitude: coords[1],
    longitude: coords[0],
    user_id: User.all.sample.id
  )

  image_url = Faker::LoremFlickr.image(size: '200x200', search_terms: ['triathlon'])
  temp_file = URI.open(image_url)
  race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
  race.save!
  puts "race #{race.id} added"
end

# 20 comments
5.times do
  comment = Comment.create!(
    body: Faker::Hipster.paragraphs(number: 2).join,
    rating: rand(6),
    negative: 'very bad',
    positive: 'very nice',
    date: rand(2019..2023),
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"
end
