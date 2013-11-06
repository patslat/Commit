require 'spec_helper'

describe SessionController do

  context 'with an existing user record' do
    let(:user) { FactoryGirl.build(:user) }

    describe 'POST #create' do
      def login(user)
        post session_url, username: user.username, password: '12345678'
      end

      def logout
        delete session_url
      end

      it 'sets a session token on the user and in the cookie' do
        user.stub(:set_session_token) { '123' }
        expect(user).to receive :set_session_token!
        login(user)
        expect(session[:session_token]).to be '123'
      end

      it 'redirects to root after successful login' do
        login(user)
        expect(response).to redirect_to root_url
      end
    end

    describe 'POST #destroy' do
      it "should clear a user's session" do
        login(user)
        expect(user).to receive(:session=).with nil
        logout
      end

      it 'should redirect to welcome' do
        login(user)
        logout
        expect(response).to redirect_to welcome_url
      end

    end

  end

end
