class Api::V1::GoalsController < ApplicationController
  before_filter :require_current_user!

  respond_to :json

  def create
    @goal = current_user.goals.build(params[:goal])
    if @goal.save
      render :json => @goal
    else
      render :json => { :errors => @goal.errors.full_messages }
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:id])

    if current_user.goals.delete(@goal)
      flash[:notice] = 'Goal deleted successfully'
      render :json => true
    else
      flash[:errors] = 'Unsuccessful delete'
      head(:unprocessable_entity)
    end
  end


  def index
    respond_with @goal = current_user.goals
  end

  def update
    @goal = current_user.goals.find(params[:id] || params[:goal][:id])

    if @goal.update_attributes(params[:goal])
      flash[:notice] = 'Goal updated successfully'

    else
      flash[:notice] = @goal.errors.full_messages.join(', ')
    end

    respond_with @goal
  end

  def show
    respond_with @goal = current_user.goals.find(params[:id])
  end

end
