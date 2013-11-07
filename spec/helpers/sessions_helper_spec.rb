require 'spec_helper'

describe SessionsHelper do
  describe '#current_user' do
    let(:user) { FactoryGirl.build(:user, :session_token => '123') }

    context 'logged in user' do
      it 'returns the current user' do
        current_user = user
        expect(current_user.session_token).to eq '123'
      end
    end

    context 'user not logged in' do
      it 'returns nil if user is not logged in' do
        expect(current_user).to be nil
      end
    end
  end
end
