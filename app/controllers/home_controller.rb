class HomeController < ApplicationController

    # Display home page
    def index
      if (params.has_key?(:id))
        @user = User.find(params[:id])
      end
    end
end
