require 'simplecov'
SimpleCov.start
require 'rails_helper'

RSpec.describe 'Home Page', type: :system do
    before :each do
        #create user
        visit new_user_path
        fill_in "Email", :with => "test@gmail.com"
        fill_in "First Name", :with => "John"
        fill_in "Last Name", :with => "Smith"
        fill_in "Password", :with => "password123"
        click_button "Create User"
    end

    # In order for tests to work, you must first pass the login page by pasting the code surrounded by comments below in each test

    describe 'Home index page' do
        it 'shows the right content' do
            #login with the newly created user
            visit login_path
            fill_in "email", :with => "test@gmail.com"
            fill_in "password", :with => "password123"
            click_button "Login"
            # --------------------------------

            visit home_path
            expect(page).to have_content('Current Points')
        end
    end
end
