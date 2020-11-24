# PBE - Member Point Tracker

## Description
This is the repository for the Professional Brotherhood of Engineer's Member Point Tracking system. This system tracks the number of points a member of the organization has earned.

## Executing Code
To run the code perform the following the steps:
1. Add the following lines to your `.zshrc` or `.bash_profile` to setup your environment variables
```
export PBE_MAIN_DEV_DBNAME="pbePoints_development"
export PBE_MAIN_TEST_DBNAME="pbePoints_test"
export PBE_MAIN_USERNAME="postgres username"
export PBE_MAIN_PASSWORD="postgres password"
export PBE_PARTICIPATION_DEV_DBNAME="pbeEvents_development"
export PBE_PARTICIPATION_TEST_DBNAME="pbeEvents_test"
export PBE_PARTICIPATION_USERNAME="postgres username"
export PBE_PARTICIPATION_PASSWORD="postgres password"
```
2. Create the necessary databases locally by running `rails db:create`
3. Run migrations with `rails db:migrate`
4. Run the server with `rails s`

## Continuous Integration & Heroku
We have GitHub actions setup to automatically deploy code to Heroku when master is updated. All that needs to be done is push a new commit to the master branch and our staging application within Heroku will be updated. To move these changes to the production app, simply go to the pipeline within Heroku and click "Promote to Production" and the changes will appear.

## Testing
We have our tests setup with RSpec and Capybara. To run al of our tests, simply use the command `bundle exec rspec`. All tests will be run and a coverage report will be generated.
