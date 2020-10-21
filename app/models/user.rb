class User < ApplicationRecord
    has_secure_password

    def edit
        @user = User.find(params[:firstname, :lastname])
    end

    def update
        @user = User.find(params[:firstname, :lastname])
    end
end
