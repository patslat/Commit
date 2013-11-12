class Commit.Views.GoalsIndex extends Backbone.View

  template: JST['goals/index']

  render: ->
    this.$el.html @template()
    return this
