class UsersController < ApplicationController

    # Makes the signup actions accessible without being logged in
    skip_before_action :authorize_login, only: [:new, :create]

    # Display the signup page
    def new
        @user = User.new
    end

    # Called when user attempts signup
    def create
        @user = User.create(params.require(:user).permit(:email, :firstName, :lastName, :role, :password))
        session[:user_id] = @user.id
        redirect_to home_path
    end
end
