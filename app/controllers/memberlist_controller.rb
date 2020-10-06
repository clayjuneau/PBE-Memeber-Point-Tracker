class MemberlistController < ApplicationController
  def index
    @users = User.order('id ASC')
  end
end
