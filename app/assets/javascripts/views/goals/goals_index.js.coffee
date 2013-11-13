class Commit.Views.GoalsIndex extends Backbone.View

  children: []

  template: JST['goals/index']

  render: ->
    @$el.html @template()
    $goalsContainer = this.$el.find "#goals-index"

    @collection.each (goal) ->
      show = new Commit.Views.GoalShow
      @children << show
      $goalsContainer.append(show.render().$el)
    return this

  remove: ->
    child.remove() for child in children
    super()
