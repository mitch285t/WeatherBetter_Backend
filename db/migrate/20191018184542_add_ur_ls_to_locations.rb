class AddUrLsToLocations < ActiveRecord::Migration[6.0]
  def change
    add_column :locations, :current_weather_url, :string
    add_column :locations, :forecast_url, :string
  end
end
