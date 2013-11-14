class Commit.Views.StepsIndex extends Backbone.View
  className: "steps-index"

  template: JST['steps/index']

  render: ->
    lastDays = @collection.lastDays(90)
    @$el.html @template(steps: lastDays)
    this
