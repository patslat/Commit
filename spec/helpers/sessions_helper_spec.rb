require 'spec_helper'

describe SessionsHelper do
  describe '#current_user' do
    let(:user) { FactoryGirl.build(:user) }

    context 'logged in user' do
      it 'returns the current user' do
        User.stub(:find_by_session) { user }
        expect(current_user).to be user
      end
    end

    context 'user not logged in' do
      it 'returns nil if user is not logged in' do
        expect(current_user).to be nil
      end
    end
  end
end
