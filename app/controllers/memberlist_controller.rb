class MemberlistController < ApplicationController
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
            @users = User.where(firstName: @searchList).or(User.where(lastName: @searchList)).order('id ASC')
        when @filter == "rolefilter" && @role != nil
            @users = User.where(role: @role).order('id ASC')
        when @filter == "pointfilter" && @points != nil && @threshold != nil
            sign = @threshold == "above" ? '>' : '<'
            @users = User.where("points #{sign} ?", @points).order('id ASC')
        else
            @users = User.order('id ASC')
        end

        if @users == nil
            @users = []
        end
    end
end
