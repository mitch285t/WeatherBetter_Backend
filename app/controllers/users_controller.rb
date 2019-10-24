require 'bcrypt'
class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create, :show]

    def index
        users = User.all
        render json: {"you made it" => "hell yeah", users: users}
    end

    def show
        Bet.call_all_bets
        user = User.find(params[:id])
        render json: {"you made it" => "hell yeah", user: user}
    end 

    def create
      @user = User.create(user_params)
      if @user.valid?
        @user.update(wallet: 0.0)
        @token = encode_token(user_id: @user.id)
        render json: { user: @user, jwt: @token }, status: :created
      else
        render json: { error: 'failed to create user' }, status: :not_acceptable
      end
    end

    def update
      user = User.find(params[:id])
      if user.update(user_edit_params)
        render json: {user: user}
      else
        render json: {error: "failed to update user"}, status: :not_acceptable
      end
    end

    private

    def user_params
        params.permit(:username, :email, :password, :password_confirmation, :wallet)
    end

    def user_edit_params
      params.require(:user).permit(:username, :email)
    end
end
