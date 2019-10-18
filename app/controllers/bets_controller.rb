class BetsController < ApplicationController
    def index
      bets = Bet.all
      render json: {"you made it" => "hell yeah", bets: bets}
    end

    def show
      bet = Bet.find(params[:id])
      render json: {"you made it" => "hell yeah", bet: bet}
    end

    
end
