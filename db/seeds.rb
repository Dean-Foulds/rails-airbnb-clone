# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"
require "json"

Home.destroy_all




puts "Fetching Properties from API..."
url = "http://api.zoopla.co.uk/api/v1/property_listings.json?country=england&api_key=#{ENV['ZOOPLA_API_KEY']}"
property_serialized = open(url).read
properties = JSON.parse(property_serialized)
properties["listing"].each do |p|
  puts "Creating home at #{p["short_description"]}"
  home = Home.new(latitude: p["latitude"], longitude: p["longitude"], address: p["displayable_address"])
  home.pictures = [ open(p["image_url"]) ] unless p["image_url"].blank?
  home.save!
end










# homes = [
#   {
#     address: "5 Polean Ln, Polperro Rd, Looe PL13 2FD, UK",
#     pictures: [ "http://i.dailymail.co.uk/i/pix/2012/07/17/article-2174754-1417BA07000005DC-389_634x422.jpg" ]
#   },

#   {
#     address: "Crown Ct, Lee, London SE12 9AA, UK",
#     pictures: [ "http://www.sedgemoor.gov.uk/media/images/s/c/netherstowey2L.jpg" ]
#   },

#   {
#     address: "Grand Parade, North Shields NE30 4JF, UK",
#     pictures: [ "http://i.dailymail.co.uk/i/pix/2012/10/07/article-2214234-1565F3A1000005DC-898_634x361.jpg" ]
#   },

#   {
#     address: "4 Ludlow Gardens, Quadring, Spalding PE11 4QH, UK",
#     pictures: [ "https://upload.wikimedia.org/wikipedia/commons/5/53/Public_Housing_in_Short_Heath_-_geograph.org.uk_-_437926.jpg" ]
#   },

#   {
#     address: "98 Thorns Dr, Greasby, Wirral CH49 3QT, UK",
#     pictures: [ "http://static.independent.co.uk/s3fs-public/thumbnails/image/2012/10/31/08/Cheap-house-jpg_140902.jpg" ]
#   },

#   {
#     address: "3 Malone Dr, Downpatrick BT30 6UD, UK",
#     pictures: [ "http://i.dailymail.co.uk/i/pix/2015/11/24/11/1F61BD5900000578-0-image-a-13_1448364498568.jpg" ]
#   },

#   {
#     address: "8A Watershaugh Rd, Warkworth, Morpeth NE65 0TU, UK",
#     pictures: [ "http://i.telegraph.co.uk/multimedia/archive/02655/housing_2655833b.jpg" ]
#   },

#   {
#     address: "3 The Saplings, Walmley",
#     pictures: ["https://upload.wikimedia.org/wikipedia/commons/c/c0/Gingerbread_House_Essex_CT.jpg"]
#   }

# ]

# homes.each do |home|
#   pictures = home.delete(:pictures)
#   home = Home.new(home)
#   home.pictures = pictures.map { |p| open(p) }
#   home.save!
# end
