require 'spec_helper'

describe 'the signup process' do

  it 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New User'
  end

  describe 'signing up a user' do
    before :each do
      visit new_user_url
      fill_in 'Username', :with => 'ermahgerd'
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
