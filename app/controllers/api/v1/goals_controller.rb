class Api::V1::GoalsController < ApplicationController
  before_filter :require_current_user!

  respond_to :json

  def create
    @goal = current_user.build_goal(params[:goal])
    if @goal.save
      flash[:notice] = 'Goal saved successfully'
    else
      flash[:errors] = @goal.errors.full_messages.join(', ')
    end

    respond_with @goal
  end

  def destroy
    @goal = current_user.goals.find(params[:id])

    if current_user.goals.delete(@goal)
      flash[:notice] = 'Goal deleted successfully'
      head(:ok)
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
