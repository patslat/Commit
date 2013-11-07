require 'spec_helper'

describe User do
  it { should allow_mass_assignment_of :username }
  it { should allow_mass_assignment_of :email }
  it { should allow_mass_assignment_of :password }

  it { should validate_presence_of :username }
  it { should validate_presence_of :email }
  it { should validate_presence_of :password_digest }

  it { should have_many(:goals).with_foreign_key(:user_id) }


  context 'without username, email, or password' do
    let(:incomplete_user) do
      FactoryGirl.build(
        :user,
        username: nil,
        email: nil,
        password: nil
      )
    end

    it 'validates presence of username' do
      expect(incomplete_user).to have(1).error_on :username
    end

    it 'validates presence of email' do
      expect(incomplete_user).to have(1).error_on :email
    end

    it 'validates presence of digest' do
      expect(incomplete_user).to have(1).error_on :password_digest
    end
  end

  context 'duplicate usernames or emails' do
    let(:user1) { FactoryGirl.build(:user) }
    let(:user2) { FactoryGirl.build(:user) }

    it 'validates uniqueness of username' do
      user1
      expect(user2).to have(1).error_on :username
    end

    it 'validates uniqueness of email' do
      user1
      expect(user2).to have(1).error_on :email
    end
  end

  describe '#is_password?' do
    context 'valid user model' do
      let(:user) { FactoryGirl.build(:user) }

      it 'returns true when valid' do
        user.is_password?('12345678')
      end

      it 'returns false when invalid' do
        user.is_password?('derp')
      end
    end
  end

  describe '#find_by_credentials' do
    context 'finds a valid user' do
      let(:user) { FactoryGirl.build(:user) }
      it 'finds a valid user' do
        @user = User.find_by_credentials(username: user.username, password: '12345678')
        expect(@user.username).to eq(user.username)
      end
    end
  end

  describe '#reset_session_token!' do
    context 'saves user and returns token' do
      let(:user) { FactoryGirl.build(:user) }

      it 'saves session token and returns it' do
        expect(user).to receive(:session_token=)
        expect(user).to receive(:save!)
        user.reset_session_token!
      end
    end
  end
end
