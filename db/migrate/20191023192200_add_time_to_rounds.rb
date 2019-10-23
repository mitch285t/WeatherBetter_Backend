class AddTimeToRounds < ActiveRecord::Migration[6.0]
  def change
    add_column :rounds, :time, :integer
  end
end
