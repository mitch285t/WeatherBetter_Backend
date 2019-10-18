class RoundsController < ApplicationController
    def index
        rounds = Round.all
        render json: {"you made it" => "hell yeah", rounds: rounds}
      end
  
    def show
        round = Round.find(params[:id])
        render json: {"you made it" => "hell yeah", round: round}
    end
  
end
