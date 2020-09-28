class ApplicationController < ActionController::Base

    # Check that the user is authorized before any action is performed
    before_action :authorize_user

    # Expose helper methods to the entire application
    helper_method :current_user
    helper_method :logged_in?
    
    # Retrieves the current logged in user
    def current_user    
        User.find_by(id: session[:user_id])  
    end
    
    # Checks that the user is logged in
    def logged_in?
        !current_user.nil?  
    end

    # Ensure the user is authorized, if not send to login page
    def authorize_user
        redirect_to '/login' unless logged_in?
    end
end
