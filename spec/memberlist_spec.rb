require 'simplecov'
SimpleCov.start
require 'rails_helper'

RSpec.describe 'MemberList Page', type: :system do
    #create user
    before :each do
        visit new_user_path
        fill_in "sample@tamu.edu", :with => "test@gmail.com"
        fill_in "John", :with => "John"
        fill_in "Smith", :with => "Smith"
        fill_in "Password", :with => "password123"
        click_button "Create User"
        User.first.update(:role => "admin")
    end

    describe 'Navigating to memberlist page' do
        it 'displays the right user' do
            #login with the newly created user
            visit login_path
            fill_in "email", :with => "test@gmail.com"
            fill_in "password", :with => "password123"
            click_button "Login"
            # --------------------------------
            visit memberlist_path
            expect(page).to have_content('John Smith')
            expect(page).to have_content('Admin')
        end
    end

    describe 'Filtering the memberlist' do
        it 'filters out the right user' do
            #login with the newly created user
            visit login_path
            fill_in "email", :with => "test@gmail.com"
            fill_in "password", :with => "password123"
            click_button "Login"
            # --------------------------------
            
            visit memberlist_path

            # Point filters --------------------
            choose('filtertype_pointfilter')

            choose('threshold_above')
            fill_in "q", :with => 5
            click_button "Search"
            expect(page).to_not have_content('John Smith')

            choose('threshold_below')
            fill_in "q", :with => 3
            click_button "Search"
            expect(page).to have_content('John Smith')

            # Name filters --------------------
            choose('filtertype_namefilter')
            fill_in "name", :with => "John"
            click_button "Search"
            expect(page).to have_content('John Smith')

            fill_in "name", :with => "Riley"
            click_button "Search"
            expect(page).to_not have_content('John Smith')

            # Role filters --------------------
            choose('filtertype_rolefilter')
            choose('userrole_member')
            click_button "Search"
            expect(page).to_not have_content('John Smith')

            choose('userrole_admin')
            click_button "Search"
            expect(page).to have_content('John Smith')

            # No filters --------------------
            choose('filtertype_nofilter')
            expect(page).to have_content('John Smith')
        end
    end

    describe 'Editing users' do
        it 'navigates to the correct page' do
            #login with the newly created user
            visit login_path
            fill_in "email", :with => "test@gmail.com"
            fill_in "password", :with => "password123"
            click_button "Login"
            # --------------------------------
            
            visit memberlist_path

            click_link('Edit')
            expect(page).to have_content('Editing')
        end
    end

    describe 'Editing event points' do
        it 'navigates to the correct page' do
            #login with the newly created user
            visit login_path
            fill_in "email", :with => "test@gmail.com"
            fill_in "password", :with => "password123"
            click_button "Login"
            # --------------------------------
            
            visit memberlist_path

            click_link('Edit Event Points')
            expect(page).to have_content('Edit Event Points')
        end
    end
end
