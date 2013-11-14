class Commit.Views.GoalShow extends Backbone.View
  className: "goal-show"
  children: []

  template: JST['goals/show']

  render: ->
    @$el.html @template(goal: @model)

    stepsView = new Commit.Views.StepsIndex(collection: @model.steps())
    @children << stepsView
    @$el.append stepsView.render().$el

    this

  remove: ->
    child.remove() for child in @children
    super()
