class UsersController < ApplicationController

    # Makes the signup actions accessible without being logged in
    skip_before_action :authorize_login, only: [:new, :create]

    # Display the signup page
    def new
        @user = User.new
    end

    # Called when user attempts signup
    def create
      if not User.find_by(email: user_params[:email]).nil?
        flash[:alert] = "#{user_params[:email]} already has an account"
        redirect_to new_user_path
      elsif params[:user][:email] == ""||params[:user][:email].nil?||params[:user][:firstName] == ""||params[:user][:firstName].nil?||params[:user][:lastName] == ""||params[:user][:lastName].nil?||params[:user][:password] == ""||params[:user][:password].nil?
        flash[:alert] = "Please fill out all fields"
        redirect_to new_user_path
      else
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to home_path
      end
    end

    def edit
        @user = User.find(params[:id])
    end

    def change_password
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            if is_admin?
                redirect_to memberlist_path, :notice => 'Success!'
            else
                redirect_to home_path, :notice => 'Success!'
            end
        else
            render edit_user_path
        end
    end

    def update_password
        @user = User.find(params[:user][:user_id])
        if @user.update(:password => params[:user][:password])
            redirect_to edit_user_path(@user), :notice => 'Success!'
        else
            redirect_to change_password_path(:id => params[:user][:user_id]), :notice => 'Failed to update password.'
        end
    end

    def user_params
        params.require(:user).permit(:email, :firstName, :lastName, :role, :password)
    end
end
