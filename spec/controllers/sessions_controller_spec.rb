require 'spec_helper'

describe SessionsController do

  def login(user)
    post :create, user: { username: user.username, password: '12345678' }
  end

  def logout
    delete :destroy
  end

  context 'with an existing user record' do
    let(:user) { FactoryGirl.build(:user) }

    describe 'POST #create' do

      it 'sets a session token on the user and in the cookie' do
        login(user)
        expect(session[:session_token]).to be_instance_of String
      end

      it 'redirects to root after successful login' do
        login(user)
        expect(response).to redirect_to root_url
      end
    end

    describe 'POST #destroy' do
      it "should clear a user's session" do
        login(user)
        User.stub(:where) { [user] }
        expect(user).to receive :reset_session_token!
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
