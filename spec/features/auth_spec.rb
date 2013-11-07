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

  describe 'after signing in' do
    before :each do
      visit new_session_url
      fill_in 'Username', :with => user.username
      fill_in 'Password', :with => '123456'
      click_button 'Sign In'
    end

    it 'redirects to root after sign' do
      expect(page).to have_content 'TODO'
    end

    it 'shows username on the homepage' do
      expect(page).to have_content user.username
    end

  end
end
