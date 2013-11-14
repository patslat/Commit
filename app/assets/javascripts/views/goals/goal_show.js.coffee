class Commit.Views.GoalShow extends Backbone.View
  className: "goal-show"
  children: []

  template: JST['goals/show']

  render: ->
    @$el.html @template(goal: @model)
    @_renderDailyGoal()
    @_renderSteps()
    this

  remove: ->
    child.remove() for child in @children
    super()


  _renderSteps: ->
    stepsView = new Commit.Views.StepsIndex(collection: @model.steps())
    @children << stepsView
    @$el.append stepsView.render().$el

  _renderDailyGoal: ->
    dailyGoalView = new Commit.Views.DailyGoalShow(model: @model.dailyGoal())
    @children << dailyGoalView
    @$el.append dailyGoalView.render().$el
