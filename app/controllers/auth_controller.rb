class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
    def create
        @user = User.find_by(username: login_params[:username])
        if @user && @user.authenticate(login_params[:password])
          token = encode_token({ user_id: @user.id })
          render json: { user: @user, jwt: token }, status: :accepted
        else
          render json: { message: 'Invalid username or password' }, status: :unauthorized
        end
    end

    private
    
    def login_params
        params.require(:auth).permit(:username, :password)
    end
end
