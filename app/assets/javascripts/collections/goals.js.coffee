class Commit.Collections.Goals extends Backbone.Collection

  dailyGoal: ->
    if !@_dailyGoal
      @_dailyGoal = new Commit.Models.DailyGoal
    @_dailyGoal

  steps: ->
    if !@_steps
      @_steps = new Commit.Collections.Steps
    @_steps

  model: Commit.Models.Goal

  parse: (data) ->
    dailyGoalData = delete data.daily_goal
    stepsData = delete data.steps
    this.dailyGoal().set dailyGoalData
    this.steps().reset stepsData
    data
