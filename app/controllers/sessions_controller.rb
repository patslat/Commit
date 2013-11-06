class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      username: params[:user][:username],
      password: params[:user][:password]
    )

    if user.nil?
      render :json => 'Invalid credentials'
    else
      self.current_user = user
      redirect_to root_url
    end
  end

  def destroy
  end
end
