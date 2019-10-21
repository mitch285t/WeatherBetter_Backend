class RoundsController < ApplicationController
    def index
        locations = Location.all
        locations.each do |loc|
            Round.manage_rounds(loc)
        end
        Round.close_open_rounds
        rounds = Round.all
        render json: {"you made it" => "hell yeah", rounds: rounds}
      end
  
    def show
        round = Round.find(params[:id])
        render json: {"you made it" => "hell yeah", round: round}
    end
  
end
