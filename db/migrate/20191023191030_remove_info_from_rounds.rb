class RemoveInfoFromRounds < ActiveRecord::Migration[6.0]
  def change

    remove_column :rounds, :is_daytime, :boolean

    remove_column :rounds, :date, :string
  end
end
