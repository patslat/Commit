class UsersController < ApplicationController
  before_filter :require_current_user!, :only => :show

  def create
    @user = User.new(params[:user])

    if @user.save
      self.current_user = @user
      redirect_to root_url
    else
      flash[:errors] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def new
    @user = User.new
  end

  def show
    @user = current_user
  end
end
