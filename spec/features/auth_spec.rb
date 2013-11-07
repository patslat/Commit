require 'spec_helper'

describe 'the login process' do
  let(:user) { FactoryGirl.create(:user) }
  context 'welcome page' do
    before :each do
      user
      visit new_session_url
    end

    it 'has a login page' do
      expect(page).to have_content 'Sign In'
    end

    it 'has a login form' do
      expect(page).to have_content 'Username'
      expect(page).to have_content 'Password'
    end
  end

  describe 'successful sign in' do
    before :each do
      visit new_session_url
      fill_in 'Username', :with => user.username
      fill_in 'Password', :with => '12345678'
      click_button 'Sign In'
    end

    it 'redirects to root' do
      expect(page).to have_content 'TODO'
    end

    it 'shows username on the homepage' do
      expect(page).to have_content user.username
    end
  end

  context 'unsuccessful sign in' do
    before :each do
      visit new_session_url
      fill_in 'Username', :with => user.username
      fill_in 'Password', :with => 'wrong password'
      click_button 'Sign In'
    end

    it 're-renders the form' do
      expect(page).to have_content 'Sign In'
    end

    it 'displays error messages' do
      expect(page).to have_content 'Invalid credentials'
    end
  end

end
