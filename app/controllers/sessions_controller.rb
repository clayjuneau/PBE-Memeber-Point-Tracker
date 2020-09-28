class SessionsController < ApplicationController
    
    # Makes the login actions accessible without being logged in
    skip_before_action :authorize_user, only: [:new, :create]

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
            redirect_to login_path
        end
    end

    # Called when user tries to logout
    def logout
        session[:user_id] = nil
        redirect_to login_path
    end
end
