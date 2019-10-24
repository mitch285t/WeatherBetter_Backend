class RenameWeatherTypeToForecastInBets < ActiveRecord::Migration[6.0]
  def change
    rename_column :bets, :weather_type, :forecast
    rename_column :bets, :bet_amount, :wager
  end
end
