class RemoveCurrentWeatherUrlFromLocations < ActiveRecord::Migration[6.0]
  def change
    remove_column :locations, :current_weather_url, :string
  end
end
