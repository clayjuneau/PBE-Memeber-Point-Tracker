class HomeController < ApplicationController
    
    # Display home page
    def index
        if (params.has_key?(:id))
            @user = User.find(params[:id])
        end

        # Find the other team's user object by seeing which user has the same email as our user
        @events = Customer.find_by(email: current_user.email).events
        puts @events
        if @events != nil
            @events = []
        end
        
        # event_ids = []
        # if customer != nil
        #     # Look up user_id in attendance table
        #     event_ids = Attendance.where(user_id: customer.id).pluck(:event_id)
        # end
        
        # if event_ids != []
        #     # Look up event_id in event table
        #     @events = Event.where(id: event_ids).order('date ASC')
        # else
        #     @events = []
        # end
    end
end