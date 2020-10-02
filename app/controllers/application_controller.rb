class ApplicationController < ActionController::Base
    include UserRole

    # Check that the user is authorized before any action is performed
    before_action :authorize_login

    # Expose helper methods to the entire application
    helper_method :current_user
    helper_method :is_logged_in?
    helper_method :is_admin?
    helper_method :authorize_admin
    
    # Retrieves the current logged in user
    def current_user    
        User.find_by(id: session[:user_id])  
    end
    
    # Checks that the user is logged in
    def is_logged_in?
        !current_user.nil?  
    end

    # Ensure the user is authorized, if not send to login page
    def authorize_login
        redirect_to '/login' unless is_logged_in?
    end

    # Checks that the user is an admin
    def is_admin?
        current_user.role == ADMIN
    end

    # Ensure the user is an admin, if not redirect them to the home page
    # Call `before_action :authorize_admin, only: [:function_name, ...]` on any pages that should only be accessible by admins
    def authorize_admin
        redirect_to home_path unless is_admin?
    end
end
