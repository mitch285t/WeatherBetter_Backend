require 'net/http'
require 'open-uri'
require 'json'
require 'date'

class Round < ApplicationRecord
    has_many :bets
    has_many :users, through: :bets
    belongs_to :location
    validates_uniqueness_of :location_id, scope: :time

    def self.manage_rounds(location)
        uri = URI.parse(location.forecast_url)
        response = Net::HTTP.get_response(uri)
        forecast = JSON.parse(response.body)
        forecast["hourly"]["data"].each do |forecast|
            self.create(location_id: location.id, 
            is_open: true, 
            time: forecast["time"], 
            forecast: forecast["summary"],
            precip_probability: forecast["precipProbability"],
            temperature: forecast["temperature"])
        end
    end
    def self.close_open_rounds
      self.all.each do |round|
        if Time.now.strftime("%s").to_i > round.time
          round.update(is_open: false)
          if round.bets.length > 0
            round.bets.each do |bet|
              bet.update(is_called: true)
            end
          end
        end
      end
    end
end
