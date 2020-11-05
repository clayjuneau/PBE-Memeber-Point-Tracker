class MemberlistController < ApplicationController
    
    # Maps to a View
    def index
        @filter = session[:filtertype]
        @threshold = session[:threshold]
        @points = session[:points]
        @role = session[:role]

        if(session[:name] != nil)
            @searchList = session[:name].split(" ")
        else
            @searchList = []
        end
        
        getFilteredUsers
    end

    # Maps to a View
    def event_points
        @events = Event.all().order(:date)
    end
    
    def update
        if params[:filtertype] != nil
            session[:filtertype] = params[:filtertype]
        end
    
        session[:role] = params[:userrole]
        session[:threshold] = params[:threshold]
        session[:points] = params[:q].to_i
        session[:name] = params[:name]
        redirect_to memberlist_path
    end

    def getFilteredUsers
        case
        when @filter == "namefilter" && @searchList != []
            @users = User.where(firstName: @searchList).or(User.where(lastName: @searchList)).order(:firstName)
        when @filter == "rolefilter" && @role != nil
            @users = User.where(role: @role).order(:firstName)
        when @filter == "pointfilter" && @points != nil && @threshold != nil
            if @threshold == "above"
                @users = User.all().order(:firstName).select { |user| user_events(user.id).sum(&:points) > @points }
            else
                @users = User.all().order(:firstName).select { |user| user_events(user.id).sum(&:points) < @points }
            end
        else
            @users = User.order(:firstName)
        end

        if @users == nil
            @users = []
        end
    end

    def update_event_points
        event = Event.find(params[:event][:saved_event_id])
        if event.update(:points => params[:event]["event_points"].to_i)
            redirect_to event_points_path, :notice => 'Success!'
        end
    end
end
