class MemberlistController < ApplicationController
  def index
    @threshold = session[:t]
    @value = session[:v]
    @users = User.order('id ASC')
  end

  def update
    @threshold = params[:threshold]
    @value = params[:q].to_i
    session[:t] = @threshold
    session[:v] = @value
    Rails.logger.debug("My object: #{@threshold.inspect}")
    Rails.logger.debug("My object: #{@value.inspect}")
    @users = User.order('id ASC')
    redirect_to memberlist_path
  end
end
