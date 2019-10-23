# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

austin = Location.create(name: "Austin", latitude: 30.2711, longitude: -97.7403, forecast_url: "https://api.darksky.net/forecast/#{ENV["API_KEY"]}/30.2672,-97.7431")
shreveport = Location.create(name: "Shreveport", latitude: 32.3519, longitude: -93.6929, forecast_url: "https://api.darksky.net/forecast/#{ENV["API_KEY"]}/32.3519,-93.6929")
chicago = Location.create(name: "Chicago", latitude: 41.9571, longitude: -87.6551, forecast_url: "https://api.darksky.net/forecast/#{ENV["API_KEY"]}/41.9571,-87.6551")