class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :location_id
      t.boolean :is_open
      t.datetime :finish_time

      t.timestamps
    end
  end
end
