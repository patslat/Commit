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
    @id = data._id

    delete data.daily_goal
    delete data.steps

    @dailyGoal().set dailyGoalData
    @steps().reset { models: stepsData, goalId: data._id }, parse: true
    data
