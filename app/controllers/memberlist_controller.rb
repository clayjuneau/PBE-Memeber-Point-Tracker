class MemberlistController < ApplicationController
  def index
    @filter = session[:f]
    @threshold = session[:t]
    @value = session[:v]
    @role = session[:r]
    @searchName = session[:n]
    if(@searchName!=nil)
      @searchList = @searchName.split(" ")
    else
      @searchList = []
    end
    @users = User.order('id ASC')
  end

  def update
    @threshold = params[:threshold]
    @value = params[:q].to_i
    @searchName = params[:n]
    @role = params[:userrole]
    @temp = params[:filtertype]
    if(@temp ==nil)
      @temp = session[:f]
      @filter = @temp
      session[:f] = @filter
    else
      session[:f] = @temp
    end
    session[:t] = @threshold
    session[:v] = @value
    session[:r] = @role
    session[:n] = @searchName
    if(@searchName!=nil)
      @searchList = @searchName.split(" ")
    else
      @searchList = []
    end
    @users = User.order('id ASC')
    redirect_to memberlist_path
  end
  def updateFilter
	  @threshold = session[:t]
    @value = session[:v]
    @role = session[:r]
    @searchName = session[:n]
    if(@searchName!=nil)
      @searchList = @searchName.split(" ")
    else
      @searchList = []
    end
    @filter = params[:filtertype]
    session[:f] = @filter
    @users = User.order('id ASC')
    redirect_to memberlist_path
  end
end
