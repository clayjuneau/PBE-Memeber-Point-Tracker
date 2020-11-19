class HomeController < ApplicationController

    helper_method :point_percentage
    
    # Display home page
    def index
        if (params.has_key?(:id))
            @user = User.find(params[:id])
        end

        if @user == nil
            @user = current_user
        end
    end

    def point_percentage(user_id)
        user_event_count = user_events(user_id, true).count.to_f
        mandatory_event_count = mandatory_events.count.to_f

        if user_event_count == 0 || mandatory_event_count == 0
            return 0
        end

        return user_event_count / mandatory_event_count
    end
end