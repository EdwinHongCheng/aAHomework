# created this file, and the "features" folder it's in, by myself
# - prob must do it manually:
#   -> since "rails generate rspec:XXX YYY" creates a "something_spec.rb" file
#      -> of the same name
# ex. rails generate rspec:model User
# - this creates: 1. spec/models/user_spec.rb (The main thing, notice the file name)
#                 2. spec/factories/users.rb (prob from FactoryBoy gem)

# Conclusion: since "auth_spec.rb" is named differently, 
# -> I guess I have to do this manually.

require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      fill_in 'Password', :with => "biscuits"
      click_on "create user"
    end

    scenario "redirects to sign-in page after signup" do
      expect(page).to have_content "Successfully created your account! Check your inbox for an activation email."
    end
  end

  feature "with an invalid user" do
    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      click_on "create user"
    end

    scenario "re-renders the new user page after failed signup" do
      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end

end
