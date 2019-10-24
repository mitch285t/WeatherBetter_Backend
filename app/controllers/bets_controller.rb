class BetsController < ApplicationController
  skip_before_action :authorized, only: [:index]
    def index
      bets = Bet.all
      render json: {"you made it" => "hell yeah", bets: bets}
    end

    def show
      bet = Bet.find(params[:id])
      render json: {"you made it" => "hell yeah", bet: bet}
    end

    def create
      @bet = Bet.create(bet_params)
      @bet.update(is_called: false)
      BetMailer.with(bet: @bet).created_bet.deliver_later
      render json: {bet: @bet}
    end

    private 

    def bet_params 
      params.require(:bet).permit(:user_id, :forecast, :round_id, :wager, :temperature, :precip_probability)
    end 
    
end
