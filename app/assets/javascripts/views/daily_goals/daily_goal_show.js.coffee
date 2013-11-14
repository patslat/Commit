class Commit.Views.DailyGoalShow extends Backbone.View
  className: "daily-goal"
  children: []

  template: JST['daily_goals/show']

  render: ->
    @$el.html @template(dailyGoal: @model)
    this
