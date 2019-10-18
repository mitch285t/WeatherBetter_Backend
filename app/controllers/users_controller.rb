class UsersController < ApplicationController
    def index
        users = User.all
        render json: {"you made it" => "hell yeah", users: users}
    end

    def show
        user = User.find(params[:id])
        render json: {"you made it" => "hell yeah", user: user}
    end 
end
