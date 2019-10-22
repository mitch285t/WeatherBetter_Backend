# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

austin = Location.create(name: "Austin", latitude: 30.2711, longitude: -97.7403, current_weather_url: "https://api.weather.gov/stations/katt/observations/latest", forecast_url: "https://api.weather.gov/gridpoints/EWX/155,90/forecast")
shreveport = Location.create(name: "Shreveport", latitude: 32.3519, longitude: -93.6929, current_weather_url: "https://api.weather.gov/stations/kshv/observations/latest", forecast_url: "https://api.weather.gov/gridpoints/SHV/78,61/forecast")
chicago = Location.create(name: "Chicago", latitude: 41.9571, longitude: -87.6551, current_weather_url: "https://api.weather.gov/stations/kord/observations/latest", forecast_url: "https://api.weather.gov/gridpoints/LOT/73,76/forecast")