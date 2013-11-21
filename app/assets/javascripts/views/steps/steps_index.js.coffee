class Commit.Views.StepsIndex extends Backbone.View

  initialize: ({ @collection }) ->
    @listenTo(@collection, 'add', @render)

  className: "steps-index"

  template: JST['steps/index']

  render: ->
    lastDays = @collection.lastDays(90)
    @$el.html @template(steps: lastDays)
    @_bindTooltip()
    this

  _bindTooltip: ->
    $squares = @$el.find '.step-square'
    $squares.tooltip()
