class StaticController < ApplicationController

    skip_before_action :authorize_login, only: [:show]

    def show
        render params[:page]
    end
end
