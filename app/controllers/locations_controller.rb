require 'net/http'
require 'open-uri'
require 'json'

class LocationsController < ApplicationController
    def index
        locations = Location.all
        render json: {"you made it" => "hell yeah", locations: locations}
    end

    def show
        location = Location.find(params[:id])
        render json: {"you made it" => "hell yeah", location: location}
    end

    def weather
        location = Location.find(params[:id])
        uri = URI.parse(location.current_weather_url)
        response = Net::HTTP.get_response(uri)
        render json: JSON.parse(response.body)
    end

    def forecast
        location = Location.find(params[:id])
        uri = URI.parse(location.forecast_url)
        response = Net::HTTP.get_response(uri)
        render json: JSON.parse(response.body)
    end
end
