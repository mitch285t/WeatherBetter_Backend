class AddInfoToRounds < ActiveRecord::Migration[6.0]
  def change
    add_column :rounds, :date, :string
    add_column :rounds, :is_daytime, :boolean
    add_column :rounds, :temperature, :integer
    add_column :rounds, :forecast, :string
  end
end
