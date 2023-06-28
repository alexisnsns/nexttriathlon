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
2.times do
  user = User.new(
    username: Faker::Name.first_name,
    email: "#{Faker::Internet.username(specifier: 5..8)}-#{rand(1000)}@yopmail.com",
    password: '123456'
  )
  user.save!
  puts "user #{user.username} added"
end

user_admin = User.new(
  username: 'alexis',
  email: 'alexis@gmail.com',
  password: 'alexis'
)
user_admin.save!
puts "user admin #{user_admin.username} added"


race = Race.new(
  title: 'Pennsylvania Happy Valley',
  description: "Located in the middle of beautiful Pennsylvania scenery just a few hours' drive or a short flight away.  Head to Penns Valley and Penn’s Cave & Wildlife Park for a boat ride tour through America’s ONLY All-Water Cavern & Farm-Nature-Wildlife Park! Be sure to stop in at the American Philatelic Center, for a free tour, at the largest stamp collecting facility in the world.  Whatever one’s definition of adventure is, we believe it can be found here in Happy Valley, Pennsylvania.",
  organizer: 'ironman',
  link: "https://www.ironman.com/im703-pennsylvania",
  date: Faker::Time.forward(days: 23, period: :morning),
  swim: 'Lake',
  bike: 'Ocean',
  run: 'Rolling',
  format: ['','L'].to_a,
  address: 'State College, PA 16801, United States',
  latitude: 40.805231396952315,
  longitude: -77.86038220287077,
  user_id: User.all.sample.id
)

image_url = 'https://ironman.kleecks-cdn.com/cdn1/attachments/photo/5554-179123421/IM_703Pennsylvania_Logo_Full_large.png'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "race #{race.id} added"



# 20 races
1.times do
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
    format: [['','L','XL'],['','M','L'],['','XL'],['','M','L','XL']].sample.to_a,
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
1.times do
  comment = Comment.create!(
    body: Faker::Hipster.paragraphs(number: 2).join,
    rating: rand(6),
    negative: 'very bad',
    positive: 'very nice',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"
end
