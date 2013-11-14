class Commit.Views.GoalsIndex extends Backbone.View
  className: "goals-index"

  children: []

  template: JST['goals/index']

  render: ->
    @collection.each (goal) =>
      show = new Commit.Views.GoalShow({model: goal})
      @children << show
      @$el.append(show.render().$el)
    this

  remove: ->
    child.remove() for child in children
    super()
