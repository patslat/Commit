class Api::V1::StepsController < ApplicationController
  respond_to :json
  before_filter :require_current_user!

  def create
    @goal = current_user.goals.find(params[:goal_id])
    @step = @goal.steps.build(params[:step])
    if @step.save
      respond_with @step
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @goal = current_user.goals.find(params[:goal_id])
    @step = @goal.steps.find(params[:id])
    if @step.destroy
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def index
    @steps = current_user.goals.find(params[:goal_id]).steps
    render :json => @steps
  end

end
