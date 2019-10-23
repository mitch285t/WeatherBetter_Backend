class ChangeStartTimeToBeIntegerInRounds < ActiveRecord::Migration[6.0]
  def change
    remove_column :rounds, :start_time, :datetime
  end
end
