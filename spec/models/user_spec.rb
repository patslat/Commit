require 'spec_helper'

describe User do
  it { should allow_mass_assignment_of :username }
  it { should allow_mass_assignment_of :email }
  it { should allow_mass_assignment_of :password }

  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password }

  it { should have_many(:goals).with_foreign_key(:user_id) }


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
