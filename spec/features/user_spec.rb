require 'spec_helper'

describe 'the signup process' do
  context 'welcome page' do
    it 'has a link to Sign Up' do
      visit welcome_url
      expect(page).to have_content 'Sign Up'
    end
  end

  context 'signing up' do
    it 'has a new user page' do
      visit new_user_url
      expect(page).to have_content 'Sign Up'
    end

    it 'has a new user form' do
      visit new_user_url
      expect(page).to have_content 'Username'
      expect(page).to have_content 'Email'
      expect(page).to have_content 'Password'
    end
  end

  describe 'signing up a user' do
    before :each do
      visit new_user_url
      fill_in 'Username', :with => 'ermahgerd'
      fill_in 'Email', :with => 'derp@derp.com'
      fill_in 'Password', :with => 'crappybara'
      click_on 'Create User'
    end

    it 'redirects to root after signup' do
      expect(page).to have_content 'TODO'
    end

    it 'shows username on the homepage after signup' do
      expect(page).to have_content 'ermahgerd'
    end
  end
end
