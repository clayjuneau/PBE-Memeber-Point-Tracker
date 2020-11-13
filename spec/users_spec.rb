require 'simplecov'
SimpleCov.start
require 'rails_helper'

RSpec.describe 'Sign Up Page', type: :system do
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

    describe 'Signing up a new user' do
        it 'completes successfully' do
            visit new_user_path
            expect(page).to have_content('Point Tracker Sign Up')
            fill_in "sample@tamu.edu", :with => "test@gmail.com"
            fill_in "John", :with => "John"
            fill_in "Smith", :with => "Smith"
            fill_in "Password", :with => "password123"
            click_button "Create User"
        end
    end

    describe 'Signing up a new user' do
        it 'completes successfully' do
            visit new_user_path
            fill_in "sample@tamu.edu", :with => "test@gmail.com"
            fill_in "John", :with => "John"
            fill_in "Smith", :with => "Smith"
            fill_in "Password", :with => "password123"
            click_button "Create User"

            visit change_password_path
        end
    end
end
