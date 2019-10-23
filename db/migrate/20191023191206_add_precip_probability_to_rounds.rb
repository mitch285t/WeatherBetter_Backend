class AddPrecipProbabilityToRounds < ActiveRecord::Migration[6.0]
  def change
    add_column :rounds, :precip_probability, :float
    rename_column :rounds, :finish_time, :start_time
  end
end
