require 'simplecov'
SimpleCov.start
require 'rails_helper'

RSpec.describe 'Home Page', type: :system do
    #create user
    before :each do
        visit new_user_path
        fill_in "sample@tamu.edu", :with => "test@gmail.com"
        fill_in "John", :with => "John"
        fill_in "Smith", :with => "Smith"
        fill_in "Password", :with => "password123"
        click_button "Create User"
    end

    # In order for tests to work, you must first pass the login page by pasting the code surrounded by comments below in each test

    describe 'Navigating to home page' do
        it 'shows the right content' do
            #login with the newly created user
            visit login_path
            fill_in "email", :with => "test@gmail.com"
            fill_in "password", :with => "password123"
            click_button "Login"
            User.first.update(:role => "admin")
            # --------------------------------

            visit home_path
        end
    end
end
