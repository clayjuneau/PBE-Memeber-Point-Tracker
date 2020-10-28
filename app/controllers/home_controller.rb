class HomeController < ApplicationController
    
    # Display home page
    def index
        if (params.has_key?(:id))
            @user = User.find(params[:id])
        end

        @events = Event.includes(:customers).where(customers: { email: current_user.email })
    end
end