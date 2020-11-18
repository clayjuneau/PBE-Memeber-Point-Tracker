class ApplicationController < ActionController::Base
    module UserRole
        MEMBER = "member"
        ADMIN = "admin"
    end

    # Check that the user is authorized before any action is performed
    before_action :authorize_login

    # Expose helper methods to the entire application
    helper_method :current_user
    helper_method :user_events
    helper_method :mandatory_events
    helper_method :is_logged_in?
    helper_method :is_admin?
    helper_method :authorize_admin
    
    # Retrieves the current logged in user
    def current_user    
        User.find_by(id: session[:user_id])  
    end

    def user_events(user_id = current_user.id)
        user = User.find_by(id: user_id)
        matching_user = Customer.where('lower(customers.email) = ?', user.email.downcase).first
        return Event.includes(:customers).where(customers: { id: matching_user.id })
    end

    def mandatory_events
        Event.all().where(mandatory: true)
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
        current_user.role == UserRole::ADMIN
    end

    # Ensure the user is an admin, if not redirect them to the home page
    # Call `before_action :authorize_admin, only: [:function_name, ...]` on any pages that should only be accessible by admins
    def authorize_admin
        redirect_to home_path unless is_admin?
    end
end
