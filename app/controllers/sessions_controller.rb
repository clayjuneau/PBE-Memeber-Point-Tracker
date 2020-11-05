class SessionsController < ApplicationController

    # Makes the login actions accessible without being logged in
    skip_before_action :authorize_login, only: [:new, :create]

    # Display login page
    def new
    end

    # Called when user tries to login
    def create
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to home_path
        else
            if @user.nil?
              flash[:alert] = "No account found for #{params[:email]}, please sign up."
            else
              flash[:alert] = "Your password is incorrect."
            end
            redirect_to login_path
        end
    end

    # Called when user tries to logout
    def logout
        session[:user_id] = nil
        redirect_to login_path
    end
end
