class AddTempAndPrecipToBets < ActiveRecord::Migration[6.0]
  def change
    add_column :bets, :temperature, :integer
    add_column :bets, :precip_probability, :float
  end
end
