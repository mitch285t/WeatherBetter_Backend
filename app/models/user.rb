class User < ApplicationRecord
    has_many :bets
    has_many :rounds, through: :bets
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validate :no_special_characters
    validate :email_must_be_valid
    def no_special_characters
        if /\W/.match(username)
            errors.add(:username, "must only contain the letters A-Z, the numbers 0-9, and the underscore")
        end
    end

    def email_must_be_valid
        unless /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i.match(email)
            errors.add(:email, "must be a valid e-mail address")
        end
    end



end
