require 'net/http'
require 'open-uri'
require 'json'
require 'date'

class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :round



  def self.call_all_bets
    self.all.each do |bet|
      if bet.is_called && !bet.payout
        bet.update(payout: 0)
        location_url = bet.round.location.forecast_url
        final_data_url = "#{location_url},#{bet.round.time}"
        final_data_uri = URI.parse(final_data_url)
        final_data_response = Net::HTTP.get_response(final_data_uri)
        final_data_full = JSON.parse(final_data_response.body)
        final_data = final_data_full["currently"]
        bet_time = bet.created_at.strftime("%s")
        forecast_data_url = "#{location_url},#{bet_time}"
        forecast_data_uri = URI.parse(forecast_data_url)
        forecast_data_response = Net::HTTP.get_response(forecast_data_uri)
        forecast_data_full = JSON.parse(forecast_data_response.body)
        forecast_data = forecast_data_full["hourly"]["data"].find do |hour|
          bet.round.time.to_s == hour["time"].to_s
        end
        byebug
        attrs = {
          "temperature" => bet.temperature,
          "precipProbability" => bet.precip_probability
        }
        if !bet.forecast.empty?
          if bet.forecast == forecast_data["summary"]
            bet.payout += bet.wager.to_f
            bet.save
          end
        end
        attrs.each do |key, value|
          if value != ""
            if (value.to_f - final_data[key].to_f).abs < 1
              if (value.to_f - forecast_data[key].to_f).abs < 1 
                bet.payout += (bet.wager.to_f + 1.25)
                bet.save
              elsif (value.to_f - forecast_data[key].to_f).abs < 5
                bet.payout += (bet.wager.to_f + (1.25 * (value.to_f - forecast_data[key].to_f).abs))
                bet.save
              else
                bet.payout += (bet.wager.to_f + (1.75 * (value.to_f - forecast_data[key].to_f).abs))
                bet.save
              end
            end
          end
        end
        bet.user.update(wallet: bet.user.wallet + bet.payout)
        bet.user.update(wallet: bet.user.wallet + 0.01)
      end
    end
  end


end
