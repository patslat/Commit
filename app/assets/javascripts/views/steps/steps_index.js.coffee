class Commit.Views.StepsIndex extends Backbone.View
  className: "steps-index"

  template: JST['steps/index']

  render: ->
    @collection.lastDays(90)
    console.log @collection.pluck('date')
    @$el.html @template(steps: @collection)
    this
