class User < ApplicationRecord
    has_many :bets
    has_many :rounds, through: :bets
end
