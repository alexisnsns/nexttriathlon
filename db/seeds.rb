require 'faker'
require 'uri'
require 'date'


Faker::Config.locale = :en

puts 'Seeding database...'
Race.destroy_all
puts 'All races destroyed'
User.destroy_all
puts 'All users destroyed'
Comment.destroy_all
puts 'All comments destroyed'

# us_coordinates = JSON.parse(File.read("#{Rails.root}/db/us_coordinates.json")).shuffle!

# 10 regular users
10.times do
  user = User.new(
    username: Faker::Name.first_name,
    email: "#{Faker::Internet.username(specifier: 5..8)}-#{rand(1000)}@yopmail.com",
    password: '123456'
  )
  user.save!
  puts "#{user.username} created"
end

# user_admin = User.new(
#   username: 'alexis',
#   email: 'alexis@gmail.com',
#   password: 'alexis'
# )
# user_admin.save!
# puts "user admin #{user_admin.username} added"

# one
race = Race.new(
  title: '70.3 Pennsylvania Happy Valley',
  description: "Located in the middle of beautiful Pennsylvania scenery just a few hours' drive or a short flight away.  Head to Penns Valley and Penn’s Cave & Wildlife Park for a boat ride tour through America’s ONLY All-Water Cavern & Farm-Nature-Wildlife Park! Be sure to stop in at the American Philatelic Center, for a free tour, at the largest stamp collecting facility in the world.  Whatever one’s definition of adventure is, we believe it can be found here in Happy Valley, Pennsylvania.",
  organizer: 'ironman',
  link: "https://www.ironman.com/im703-pennsylvania",
  date: DateTime.new(2023,7,2),
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
p#{race.title} created"


# two
race = Race.new(
  title: '70.3 Musselman',
  description: "IRONMAN 70.3 Musselman is the perfect race for athletes who want to experience an urban, upstate adventure. You’ll start your race with a swim in Seneca Lake followed by a bike course that takes you into the rolling hills of the Finger Lakes Region, boasting incredible views of both Seneca and Cayuga Lakes. The run course will lead you on a journey along the shores of Seneca Lake and through the vineyard region before completing the day with a picturesque finish on the shores of one of the most iconic Finger Lakes. It’s not just about finishing – it’s about experiencing all this beautiful area has to offer and making memories along the way.",
  organizer: 'Ironman',
  link: "https://www.ironman.com/im703-musselman-course",
  date:  DateTime.new(2023,7,9),
  swim: 'Lake',
  bike: 'Rolling',
  run: 'Rolling',
  format: ['','L'].to_a,
  address: 'Geneva, New York',
  latitude:   42.86799040968956,
  longitude: -76.98413512765573,
  user_id: User.all.sample.id
)

image_url = 'https://ironman.kleecks-cdn.com/cdn1/attachments/photo/ef60-178084021/IM23_703Musselman_Logo_full_large.png'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "#{race.title} created"

# three
race = Race.new(
  title: 'IM Lake Placid',
  description: "When you think of the world's greatest, most sought after triathlons, a very short list of events from around the world comes to mind. The best of the best-triathlon royalty. IRONMAN Lake Placid is one of those special events, an icon of the sport that draws in triathletes from all over the world to test themselves on this legendary course.",
  organizer: 'Ironman',
  link: "https://www.ironman.com/im-lake-placid",
  date:  DateTime.new(2023,7,23),
  swim: 'Lake',
  bike: 'Hilly',
  run: 'Hilly',
  format: ['', 'XL'].to_a,
  address: 'Lake Placid, New York',
  latitude: 44.27941302581884,
  longitude: -73.97960697491882,
  user_id: User.all.sample.id
)

image_url = 'https://ironman.kleecks-cdn.com/cdn1/attachments/photo/c17d-182158097/IM23_LakePlacid_AthleticBrew_Vinfast_NASeries_MDOTLogo_Standard_large.png'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "#{race.title} created"



# four
race = Race.new(
  title: '70.3 Maine',
  description: "Augusta is the perfect place to play this summer in this eclectic downtown city along the river.  From outdoor activities to culinary delights, visit Maine to experience it all. Maine brings one of the top national parks in the country with Acadia National Park showcasing the rugged and beautiful coastline to many more outdoor activities. Maine is known for lobster rolls, chowder and everything blueberry. This charming capital will offer you that getaway race you’ve been looking for.  This event features a 1.2-mile downriver swim in the Kennebec River, a 56 mile bike offering a mix of climbs and descents,  and a 13.1-mile run along the canopy tree-lined Kennebec River Rail Trail.",
  organizer: 'Ironman',
  link: "https://www.ironman.com/im703-maine",
  date:  DateTime.new(2023,7,30),
  swim: 'River',
  bike: 'Rolling',
  run: 'Rolling',
  format: ['', 'L'].to_a,
  address: 'Augusta, Maine',
  latitude: 44.311240525180196,
  longitude: -69.77533182565988,
  user_id: User.all.sample.id
)

image_url = 'https://ironman.kleecks-cdn.com/cdn1/attachments/photo/11f9-177300411/IM23_703Maine_NortheastTriClubChampionship_Logo_large.png'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "#{race.title} created"



# five
race = Race.new(
  title: 'Pleasants Landing Triathlon',
  description: "Hosted at Pleasants Landing Marina at Lake Anna, this race and venue are amazing. The time trial swim takes place in the southeast portion of Lake Anna, about 1/4 mile from where the “hot side” of Lake Anna empties into the cold side, resulting in water temperatures that are 4-6 degree’s warmer than the rest of the lake at this time of year. So, you  can look forward to above average water temperatures in mid-October. The last open water race of the regular season Olympic starts at 9AM and the Sprint starts at 9:30AM, so you can sleep in a little and make it a day at the lake with family and friends. The race site and finish line are surrounded by water and have a view of the Blue Ridge Mountains to the West; it’s a great place to spend the weekend outside",
  organizer: 'Kinetic Multisports',
  link: "https://www.trisignup.com/Race/VA/Bumpass/PleasantsLandingTriathlonFestival",
  date:  DateTime.new(2023,7,10),
  swim: 'Lake',
  bike: 'Rolling',
  run: 'Rolling',
  format: ['', 'S', 'M'].to_a,
  address: 'Lake Anna, VA',
  latitude: 38.11394768134194,
  longitude: -77.81796631369227,
  user_id: User.all.sample.id
)

image_url = 'https://d368g9lw5ileu7.cloudfront.net/races/race56021-logo.bBIvv2.png'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "#{race.title} created"


# six
race = Race.new(
  title: 'Niantic Bay Triathlon',
  description: "A flat, sprint distance race through scenic shoreline communities of Niantic and East Lyme, the Niantic Bay Triathlon is a great race for beginner or experienced triathletes. Swim a 1/2 mile in the calm of Niantic Bay without waves or strong currents. Bike an 11.4 mile loop through East Lyme with water views and long straightaways along flat, shaded roads. Run 3.2 miles along the oceanfront area lined with cheering spectators before a spectacular beach finish.",
  organizer: 'Hartford Marathon',
  link: "https://www.hartfordmarathon.com/niantic-bay-triathlon/",
  date:  DateTime.new(2023,8,13),
  swim: 'Ocean/Sea',
  bike: 'Flat',
  run: 'Flat',
  format: ['', 'S'].to_a,
  address: 'Niantic Bay, CT',
  latitude: 41.325290324319634,
  longitude: -72.19477691978966,
  user_id: User.all.sample.id
)

image_url = 'https://hartfordmarathon.com/wp-content/uploads/2016/11/logo_niantic_bay_tri.jpg'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "#{race.title} created"

# seven
race = Race.new(
  title: 'Westchester Triathlon',
  description: "
  In its 37th year, the Westchester Triathlon has grown to be a premier Olympic distance race on the East Coast.  Host to the Northeast Collegiate Triathlon Conference Championships and kids race with nearly 500 youth participants, Westchester Triathlon is dedicated to the promotion and development of the sport through healthy competition.
  As a non-for profit 501(c)(3), all net proceeds from the race are donated to charity.  Since 2004 the Westchester Triathlon has donated over 1.2 million dollars to local charities.
  It takes a village to put on a great race.  Westchester is a family organization, and in the true sense of the word.  Athletes, volunteers, sponsors, supporters, spectators and the towns we work with are all part of the Westchester family.  Standing at the finish line cheering or crossing the finish line for the first time or hundredth time, you will realize that you are part of something bigger than yourself and part of OUR FAMILY!",
  organizer: 'Westchester Triathlon',
  link: "https://westchestertriathlon.org",
  date:  DateTime.new(2023,9,24),
  swim: 'Ocean/Sea',
  bike: 'Flat',
  run: 'Flat',
  format: ['', 'XS', 'M'].to_a,
  address: 'Rye, NY',
  latitude: 40.97937693688457,
  longitude: -73.68283792863696,
  user_id: User.all.sample.id
)

image_url = 'https://images.squarespace-cdn.com/content/v1/5861aa782994ca5ee97b6693/1e20dc95-509a-40ec-b51e-1ccf72911be8/TRI_combined_vertical---cropped.png?format=1500w'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "#{race.title} created"


# eight
race = Race.new(
  title: 'Lake George Triathlon',
  description: "
  Located at the southeast base of the beautiful Adirondack Mountains, Lake George – nicknamed the ‘Queen of American Lakes’ is a unique yet majestic venue for a triathlon that will provide you with breathtaking views all throughout the course. The Lake George Triathlon festival is a fun and competitive weekend on the shores of Lake George, with a family friendly atmosphere. ",
  organizer: 'Alpha',
  link: "https://alpha.win/event/lake-george-ny/",
  date:  DateTime.new(2023,9,2),
  swim: 'Lake',
  bike: 'Rolling',
  run: 'Flat',
  format: ['', 'S', 'M', 'L'].to_a,
  address: 'Lake George, NY',
  latitude: 43.42642204069176,
  longitude: -73.71281690141443,
  user_id: User.all.sample.id
)

image_url = 'https://alphawin.wpenginepowered.com/wp-content/uploads/2021/01/Lake-George-Overhead-view-1024x681.jpg'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "#{race.title} created"

# nine
race = Race.new(
  title: 'New Jersey State Triathlon',
  description: "
  The New Jersey State Triathlon features one of the fastest, flattest courses in the Nation. It begins with a calm swim in Mercer Lake then winds through beautiful Mercer County for an incredible spectator lined finish and festival celebration.
  No where else can you race in the largest triathlon in New Jersey, at one of the top 25 largest triathlons in the Nation and a sell out every year since its inception. ",
  organizer: 'New Jersey State Triathlon',
  link: "https://www.cgiracing.com/newjerseystatetri/",
  date:  DateTime.new(2023,7,15),
  swim: 'Lake',
  bike: 'Flat',
  run: 'Flat',
  format: ['', 'S', 'M'].to_a,
  address: 'West Windsor, NJ ',
  latitude: 40.266908788399284,
  longitude:-74.63998652659737,
  user_id: User.all.sample.id
)

image_url = 'https://alphawin.wpenginepowered.com/wp-content/uploads/2021/01/Lake-George-Overhead-view-1024x681.jpg'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "#{race.title} created"

# ten
race = Race.new(
  title: 'Reston Triathlon',
  description: "
  For 36 years, the Reston Triathlon has served as a staple in the community. The Olympic distance event has challenged athletes from across the United States and has been affectionately called the “Reston Triathlon World Championship.” During COVID-19 the previous board managing the event worked tirelessly to keep the tradition alive but sadly announced in 2021 that they no longer could financially and logistically sustain the triathlon.

  Working closely with the previous board, CORE Foundation is thrilled to bring back this event and continue the legacy of the Reston Triathlon founded in 1984. The Reston Triathlon will make its comeback debut on September 10, 2023, and annually going forward on the first Sunday following Labor Day.",
  organizer: 'Core Foundation',
  link: "https://restonsprinttri.org/racing-in-reston-events/reston-olympic-triathlon/",
  date:  DateTime.new(2023,9,10),
  swim: 'Lake',
  bike: 'Rolling',
  run: 'Rolling',
  format: ['', 'S', 'M'].to_a,
  address: 'Reston, VA  ',
  latitude: 38.959288721279144,
  longitude: -77.35685575247616,
  user_id: User.all.sample.id
)

image_url = 'https://restontriathlon.org/wp-content/uploads/2017/12/RestonTri-logo.jpg'
temp_file = URI.open(image_url)
race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
race.save!
puts "#{race.title} created"

# 20 races
# 1.times do
#   coords = us_coordinates.pop
#   race = Race.new(
#     title: Faker::Lorem.sentence(word_count: 2),
#     description: Faker::Hipster.paragraphs(number: 1).join,
#     organizer: Faker::Company.name,
#     link: 'www.ironman.com',
#     date: Faker::Time.forward(days: 23, period: :morning),
#     bike: %w[Flat Rolling Hilly].sample,
#     swim: %w[Ocean/Sea Lake].sample,
#     run: %w[Flat Rolling Hilly].sample,
#     format: [['','L','XL'],['','M','L'],['','XL'],['','M','L','XL']].sample.to_a,
#     address: Faker::Address.full_address,
#     latitude: coords[1],
#     longitude: coords[0],
#     user_id: User.all.sample.id
#   )

#   image_url = Faker::LoremFlickr.image(size: '200x200', search_terms: ['triathlon'])
#   temp_file = URI.open(image_url)
#   race.photo.attach(io: temp_file, filename: 'image.jpg', content_type: "image/jpeg")
#   race.save!
#   puts "#{race.title} created"
# end

  comment = Comment.create!(
    body: "I managed to finish this race; it was very tough because of the sun. The people from the staff were very nice; I'll definitely come back.",
    rating: 4,
    negative: 'Maybe do the race later in the calendar',
    positive: 'Amazing staff',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"


  comment = Comment.create!(
    body: "Everything was perfect from A to Z. Nothing to add",
    rating: 5,
    negative: 'Nothing.',
    positive: 'Everything was great',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"


  comment = Comment.create!(
    body: "I race here every year. Really enjoy the scenery. Food is always great at the end of the run.",
    rating: 5,
    negative: 'Nothing.',
    positive: '+ + + for the snacks at the end ;)',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"

  comment = Comment.create!(
    body: "My wife raced here. I was a volunteer. The day was wonderful, I definitely recommend racing here.",
    rating: 5,
    negative: 'Nothing.',
    positive: 'Bike course is really fast',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"

  comment = Comment.create!(
    body: "I was quite disappointed last time I came here. Not enough staff, too many participants...",
    rating: 2,
    negative: 'Not enough staff',
    positive: 'Scenery is beautiful',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"

  comment = Comment.create!(
    body: "I crashed last time I raced here. Could not finish the race. However from what I saw everything was pitch perfect",
    rating: 2,
    negative: ' - - -',
    positive: 'Good weather',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"

  comment = Comment.create!(
    body: "First time racer here; I don't have anything to compare this race to but I really enjoyed it !!",
    rating: 2,
    negative: '/',
    positive: 'Will defintely come back',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"

  comment = Comment.create!(
    body: "I managed to finish this race; it was very tough because of the sun. The people from the staff were very nice; I'll definitely come back.",
    rating: 4,
    negative: 'Maybe do the race later in the calendar',
    positive: 'Amazing staff',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"


  comment = Comment.create!(
    body: "Everything was perfect from A to Z. Nothing to add",
    rating: 5,
    negative: 'Nothing.',
    positive: 'Everything was great',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"


  comment = Comment.create!(
    body: "I race here every year. Really enjoy the scenery. Food is always great at the end of the run.",
    rating: 5,
    negative: 'Nothing.',
    positive: '+ + + for the snacks at the end ;)',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"

  comment = Comment.create!(
    body: "My wife raced here. I was a volunteer. The day was wonderful, I definitely recommend racing here.",
    rating: 5,
    negative: 'Nothing.',
    positive: 'Bike course is really fast',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"

  comment = Comment.create!(
    body: "I was quite disappointed last time I came here. Not enough staff, too many participants...",
    rating: 2,
    negative: 'Not enough staff',
    positive: 'Scenery is beautiful',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"

  comment = Comment.create!(
    body: "I crashed last time I raced here. Could not finish the race. However from what I saw everything was pitch perfect",
    rating: 2,
    negative: ' - - -',
    positive: 'Good weather',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"

  comment = Comment.create!(
    body: "First time racer here; I don't have anything to compare this race to but I really enjoyed it !!",
    rating: 2,
    negative: '/',
    positive: 'Will defintely come back',
    date: rand(2019..2023).to_s,
    user_id: User.all.sample.id,
    race_id: Race.all.sample.id
  )
  puts "comment #{comment.id} added"
