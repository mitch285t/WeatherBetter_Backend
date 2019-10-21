require 'net/http'
require 'open-uri'
require 'json'
require 'date'

class Round < ApplicationRecord
    has_many :bets
    has_many :users, through: :bets
    belongs_to :location
    validates_uniqueness_of :location_id, scope: :finish_time

    def self.manage_rounds(location)
        uri = URI.parse(location.forecast_url)
        response = Net::HTTP.get_response(uri)
        forecast = JSON.parse(response.body)
        forecast["properties"]["periods"].each do |forecast|
            self.create(location_id: location.id, is_open: true, finish_time: DateTime.parse(forecast["endTime"]))
        end
    end
    def self.close_open_rounds
        self.all.each do |round|
            if Time.now > round.finish_time
                round.update(is_open: false)
            end
        end
    end
end
