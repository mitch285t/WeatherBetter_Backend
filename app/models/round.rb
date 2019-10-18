class Round < ApplicationRecord
    has_many :bets
    has_many :users, through: :bets
    belongs_to :location
end
