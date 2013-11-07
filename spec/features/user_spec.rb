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

  describe 'sign up' do
    context 'successful sign up' do
      before :each do
        visit new_user_url
        fill_in 'Username', :with => 'ermahgerd'
        fill_in 'Email', :with => 'ermah@gerd.com'
        fill_in 'Password', :with => 'crappybara'
        click_button 'Sign Up'
      end

      it 'redirects to root' do
        expect(page).to have_content 'TODO'
      end

      it 'shows username on the homepage after signup' do
        expect(page).to have_content 'ermahgerd'
      end
    end

    context 'unsuccessful sign up' do
      before :each do
        visit new_user_url
        fill_in 'Username', :with => 'ermahgerd'
        fill_in 'Email', :with => ''
        fill_in 'Password', :with => '123456'
        click_button 'Sign Up'
      end

      it 'should re-render form' do
        expect(page).to have_content 'Sign Up'
        expect(page).to have_content 'Username'
        expect(page).to have_content 'Email'
        expect(page).to have_content 'Password'
      end

      it 'should contain old information' do
        expect(find_field('Username').value).to have_content 'ermahgerd'
      end
    end
  end
end
