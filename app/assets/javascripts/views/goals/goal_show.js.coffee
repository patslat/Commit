class Commit.Views.GoalShow extends Backbone.View
  className: "goal-show"
  children: []

  template: JST['goals/show']

  render: () ->
    @$el.html @template(goal: @model)
    $stepsContainer = @$el.find "goal-steps"
    # render steps index and append to $stepsContainer
    return this

  remove: ->
    child.remove() for child in @children
    super()
