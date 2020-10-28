class HomeController < ApplicationController
    
    # Display home page
    def index
        if (params.has_key?(:id))
            @user = User.find(params[:id])
        end

        # Find the other team's user object by seeing which user has the same email as our user
        event_user = EventUser.find_by(email: current_user.email)
        
        if event_user != nil
            # Look up user_id in attendance table
            event_ids = Attendance.where(user_id: event_user.id).pluck(:event_id)
        end
        
        if event_ids != nil
            # Look up event_id in event table
            @events = Event.where(id: event_ids).order('date ASC')
        else
            @events = []
        end
    end
end