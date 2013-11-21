class Commit.Models.Goal extends Backbone.Model

  dailyGoal: ->
    if !@_dailyGoal
      @_dailyGoal = new Commit.Models.DailyGoal
    @_dailyGoal

  steps: =>
    if !@_steps
      @_steps = new Commit.Collections.Steps
    @_steps


  parse: (data) ->
    dailyGoalData = dailyGoalData || data.daily_goal
    stepsData = data.steps

    delete data.daily_goal
    delete data.steps

    this.dailyGoal().set dailyGoalData
    this.steps().reset { models: stepsData, goalId: data._id }, parse: true
    data
