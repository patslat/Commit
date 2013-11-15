class Commit.Views.DailyGoalShow extends Backbone.View

  className: "daily-goal collapse"

  attributes: ->
    "id": "daily-goal-#{ @model.get '_id' }"

  children: []

  template: JST['daily_goals/show']

  render: ->
    @$el.html @template(dailyGoal: @model)
    this
