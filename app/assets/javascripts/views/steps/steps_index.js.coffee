class Commit.Views.StepsIndex extends Backbone.View
  className: "steps-index"

  template: JST['steps/index']

  render: ->
    @$el.html @template(steps: @collection)
    this
