class AddLocTimeIndexToRounds < ActiveRecord::Migration[6.0]
  def change
    add_index(:rounds, [:location_id, :finish_time], unique: true)
  end
end
