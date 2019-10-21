require 'net/http'
require 'open-uri'
require 'json'

class Round < ApplicationRecord
    has_many :bets
    has_many :users, through: :bets
    belongs_to :location

    def self.manage_rounds(location)
        
    end
end
