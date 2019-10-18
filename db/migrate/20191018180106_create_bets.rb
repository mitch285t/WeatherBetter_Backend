class CreateBets < ActiveRecord::Migration[6.0]
  def change
    create_table :bets do |t|
      t.integer :user_id
      t.float :payout
      t.string :weather_type
      t.integer :round_id
      t.float :bet_amount
      t.boolean :is_called

      t.timestamps
    end
  end
end
