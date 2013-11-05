require 'spec_helper'

describe User do
  context 'without username, email, or password' do
    let(:incomplete_user) { FactoryGirl.create(:blank_user) }

    it 'validates presence of username' do
      expect(incomplete_user).to have(1).error_on :username
    end

    it 'validates presence of email' do
      expect(incomplete_user).to have(1).error_on :email
    end

    it 'validates presence of password' do
      expect(incomplete_user).to have(1).error_on :password
    end
  end

  context 'duplicate usernames or emails' do
    let(:user1) { FactoryGirl.create(:user) }
    let(:user2) { FactoryGirl.create(:user) }

    it 'validates uniqueness of username' do
      user1
      expect(user2).to have(1).error_on :username
    end

    it 'validates uniqueness of email' do
      user1
      expect(user2).to have(1).error_on :email
    end
  end
end
