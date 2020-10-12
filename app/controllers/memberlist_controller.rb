class MemberlistController < ApplicationController
  def index
    @threshold = session[:t]
    @value = session[:v]
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
    session[:t] = @threshold
    session[:v] = @value
    session[:n] = @searchName
    if(@searchName!=nil)
      @searchList = @searchName.split(" ")
    else
      @searchList = []
    end
    @users = User.order('id ASC')
    redirect_to memberlist_path
  end
end
